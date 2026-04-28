# Sourced by bootstrap.sh
# Patches Operator Mono with Nerd Font glyphs, or falls back to Cascadia Code NF.

FONT_DIR="${HOME}/Library/Fonts"
CACHE_DIR="${HOME}/.cache/bento/nerd-fonts-patcher"
PATCHER_VERSION="v3.4.0"

OPERATOR_MONO_WEIGHTS=(
    Bold
    BoldItalic
    Book
    BookItalic
    Light
    LightItalic
    Medium
    MediumItalic
    XLight
    XLightItalic
)

# Count patched Nerd Font files in ~/Library/Fonts/.
# The patcher renames weights (Book→Regular, XLight→ExtraLight), so we count
# total files rather than matching per-weight names.
count_patched_fonts() {
    local matches=("${FONT_DIR}"/OperatorMonoNerdFontMono-*.*(N))
    echo ${#matches}
}

# Download Nerd Fonts Patcher
download_patcher() {
    echo "Downloading Nerd Fonts patcher ${PATCHER_VERSION}..."
    mkdir -p "$CACHE_DIR"

    local zip_path="${CACHE_DIR}/FontPatcher.zip"
    if ! gh release download "$PATCHER_VERSION" \
        --repo ryanoasis/nerd-fonts \
        --pattern "FontPatcher.zip" \
        --output "$zip_path" \
        --clobber; then
        return 1
    fi

    if ! unzip -qo "$zip_path" -d "$CACHE_DIR"; then
        rm -f "$zip_path"
        return 1
    fi

    rm -f "$zip_path"
}

# Patch a Single Font Weight
patch_weight() {
    local weight=$1
    local source="${FONT_DIR}/OperatorMono-${weight}.otf"
    local output_dir="${CACHE_DIR}/output"

    echo "  Patching OperatorMono-${weight}..."
    rm -rf "$output_dir"
    mkdir -p "$output_dir"

    fontforge -script "${CACHE_DIR}/font-patcher" \
        --mono --complete \
        --outputdir "$output_dir" \
        "$source" 2>"${CACHE_DIR}/fontforge-${weight}.log"

    # Move patched font to ~/Library/Fonts/
    # The patcher output name varies by version, so move whatever it produced
    local patched_files=("${output_dir}"/*(N))
    if (( ${#patched_files} )) && [[ -f "${patched_files[1]}" ]]; then
        mv "${output_dir}"/* "$FONT_DIR/"
    else
        echo "  [!!] Patching failed for OperatorMono-${weight}, skipping"
        echo "       See ${CACHE_DIR}/fontforge-${weight}.log"
        rm -rf "$output_dir"
        return 1
    fi

    rm -rf "$output_dir"
}

# Resolve Font: Patched Operator Mono or Cascadia Code NF
TERMINAL_FONT="CascadiaCodeNF-Regular"
TERMINAL_FONT_SIZE=12

if [[ -f "${FONT_DIR}/OperatorMono-Book.otf" ]]; then
    # Check if all weights have been patched
    # Compare patched file count to source weight count
    needs_patching=false
    if (( $(count_patched_fonts) < ${#OPERATOR_MONO_WEIGHTS[@]} )); then
        needs_patching=true
    fi

    if $needs_patching; then
        # Ensure gh is available before attempting to download the patcher
        if [[ ! -f "${CACHE_DIR}/font-patcher" ]] && ! command -v gh &>/dev/null; then
            echo "[!!] gh not found, cannot download Nerd Fonts patcher, using Cascadia Code NF"
            needs_patching=false
        fi

        # Ensure patcher is cached
        if $needs_patching && [[ ! -f "${CACHE_DIR}/font-patcher" ]]; then
            download_patcher || {
                echo "[!!] Failed to download Nerd Fonts patcher, using Cascadia Code NF"
                needs_patching=false
            }
        fi

        # Ensure fontforge is available
        if $needs_patching && ! command -v fontforge &>/dev/null; then
            echo "[!!] fontforge not found, using Cascadia Code NF"
            needs_patching=false
        fi

        # Patch all weights
        if $needs_patching; then
            echo "Patching Operator Mono with Nerd Font glyphs..."
            for weight in "${OPERATOR_MONO_WEIGHTS[@]}"; do
                [[ -f "${FONT_DIR}/OperatorMono-${weight}.otf" ]] || continue
                patch_weight "$weight" || true
            done
        fi
    fi

    # Detect the patched regular-weight font for terminal use
    # The patcher renames Book→Regular and abbreviates the PostScript name,
    # so read the actual PostScript name from the file via Spotlight metadata
    patched_regular=("${FONT_DIR}"/OperatorMonoNerdFontMono-{Regular,Book}.*(N))
    if (( ${#patched_regular} )); then
        psname=$(mdls -name com_apple_ats_name_postscript -raw "${patched_regular[1]}" 2>/dev/null \
            | tr -d '()\" \n')
        if [[ -n "$psname" ]]; then
            TERMINAL_FONT="$psname"
        fi
    fi
fi

# Update Terminal.app and iTerm2 Periwinkle Profile Fonts
# Terminal.app needs NSKeyedArchiver-encoded NSFont data via plistlib.
# iTerm2 stores fonts as simple strings ("PostScriptName Size").
# A running iTerm2 caches preferences in memory and overwrites defaults changes
# on save, so we quit it before writing and relaunch afterward.
python3 - "$TERMINAL_FONT" "$TERMINAL_FONT_SIZE" <<'PYTHON'
import os, sys, plistlib, subprocess, time

font_name = sys.argv[1]
font_size = float(sys.argv[2])


def update_terminal_app():
    """Update Terminal.app Periwinkle profile font via NSKeyedArchiver encoding."""
    font_data = plistlib.dumps({
        "$version": 100000,
        "$archiver": "NSKeyedArchiver",
        "$top": {"root": plistlib.UID(1)},
        "$objects": [
            "$null",
            {
                "NSSize": font_size,
                "NSfFlags": 16,
                "NSName": plistlib.UID(2),
                "$class": plistlib.UID(3),
            },
            font_name,
            {"$classname": "NSFont", "$classes": ["NSFont", "NSObject"]},
        ],
    }, fmt=plistlib.FMT_BINARY)

    result = subprocess.run(
        ["defaults", "export", "com.apple.terminal", "-"],
        capture_output=True,
    )
    if result.returncode != 0:
        print("Terminal.app preferences not found, skipping", file=sys.stderr)
        return

    preferences = plistlib.loads(result.stdout)
    profile = preferences.get("Window Settings", {}).get("Periwinkle")
    if profile is None:
        print("Terminal.app Periwinkle profile not found, skipping", file=sys.stderr)
        return

    profile["Font"] = font_data
    preferences["Window Settings"]["Periwinkle"] = profile
    subprocess.run(
        ["defaults", "import", "com.apple.terminal", "-"],
        input=plistlib.dumps(preferences, fmt=plistlib.FMT_BINARY),
        check=True,
    )
    print(f"Terminal.app Periwinkle font set to {font_name} {int(font_size)}pt")


def update_iterm2():
    """Update iTerm2 Periwinkle profile font, handling a running instance."""
    iterm_font = f"{font_name} {int(font_size)}"

    result = subprocess.run(
        ["defaults", "export", "com.googlecode.iterm2", "-"],
        capture_output=True,
    )
    if result.returncode != 0:
        print("iTerm2 preferences not found, skipping", file=sys.stderr)
        return

    iterm_prefs = plistlib.loads(result.stdout)
    bookmarks = iterm_prefs.get("New Bookmarks", [])

    for bookmark in bookmarks:
        if bookmark.get("Name") == "Periwinkle":
            bookmark["Normal Font"] = iterm_font
            bookmark["Non Ascii Font"] = iterm_font
            break
    else:
        print("iTerm2 Periwinkle profile not found, skipping", file=sys.stderr)
        return

    # A running iTerm2 will overwrite defaults changes with its in-memory state.
    # Quit it before writing so the import sticks.
    inside_iterm = os.environ.get("TERM_PROGRAM") == "iTerm.app"
    iterm_running = subprocess.run(
        ["pgrep", "-x", "iTerm2"], capture_output=True,
    ).returncode == 0

    if iterm_running and not inside_iterm:
        subprocess.run(["osascript", "-e", 'tell application "iTerm" to quit'])
        # Wait for iTerm2 to flush preferences and exit
        for _ in range(10):
            if subprocess.run(["pgrep", "-x", "iTerm2"], capture_output=True).returncode != 0:
                break
            time.sleep(0.5)

    iterm_prefs["New Bookmarks"] = bookmarks
    subprocess.run(
        ["defaults", "import", "com.googlecode.iterm2", "-"],
        input=plistlib.dumps(iterm_prefs, fmt=plistlib.FMT_BINARY),
        check=True,
    )
    print(f"iTerm2 Periwinkle font set to {iterm_font}")

    if iterm_running and not inside_iterm:
        subprocess.Popen(["open", "-a", "iTerm"])
    elif iterm_running and inside_iterm:
        print("  [!!] Restart iTerm2 to apply font changes")


update_terminal_app()
update_iterm2()
PYTHON
