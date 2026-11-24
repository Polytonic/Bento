# Sourced by bootstrap.sh
# Installs the repo's iTerm2 Periwinkle profile with the font resolved by fonts.sh.

# Install iTerm2 Periwinkle Profile
# iTerm2 stores fonts as simple strings ("PostScriptName Size").
# A running iTerm2 caches preferences in memory and overwrites defaults changes
# on save, so we quit it before writing and relaunch afterward.
python3 - "$TERMINAL_FONT" "$TERMINAL_FONT_SIZE" "${REPOSITORY_ROOT}/system/themes/Periwinkle.json" <<'PYTHON'
import json, os, sys, plistlib, subprocess, time

font_name = sys.argv[1]
font_size = float(sys.argv[2])
iterm_profile_path = sys.argv[3]


def update_iterm2():
    """Install the repo's iTerm2 Periwinkle profile with this machine's font, handling a running instance."""
    iterm_font = f"{font_name} {int(font_size)}"

    try:
        with open(iterm_profile_path) as profile_file:
            profile = json.load(profile_file)
    except (OSError, ValueError):
        profile = None
    if not isinstance(profile, dict) or profile.get("Name") != "Periwinkle" or "Guid" not in profile:
        print(f"iTerm2 Periwinkle profile not readable at {iterm_profile_path}, skipping", file=sys.stderr)
        return

    # The repo file may carry another machine's font, so this machine's font should always win.
    profile["Normal Font"] = iterm_font
    profile["Non Ascii Font"] = iterm_font

    result = subprocess.run(
        ["defaults", "export", "com.googlecode.iterm2", "-"],
        capture_output=True,
    )
    if result.returncode != 0:
        print("iTerm2 preferences not found, skipping", file=sys.stderr)
        return

    iterm_prefs = plistlib.loads(result.stdout)
    bookmarks = iterm_prefs.get("New Bookmarks", [])

    # The repo profile should replace an existing Periwinkle entry in place, or be added.
    for index, bookmark in enumerate(bookmarks):
        if bookmark.get("Name") == "Periwinkle":
            bookmarks[index] = profile
            break
    else:
        bookmarks.append(profile)

    # Periwinkle should always become the default: the repo defines the setup, and a
    # launched iTerm2 always has its own "Default" profile selected.
    iterm_prefs["Default Bookmark Guid"] = profile["Guid"]

    # The window theme should be Minimal (5), which styles the window chrome: it is a
    # global setting, not stored in the profile.
    iterm_prefs["TabStyleWithAutomaticOption"] = 5

    # A running iTerm2 will overwrite defaults changes with its in-memory state.
    # Quit it before writing so the import sticks.
    # pgrep should include ancestors (-a) so iTerm2 is detected from a shell inside it.
    # inside_iterm should also hold when iTerm2 is an ancestor (matched only with -a),
    # because TERM_PROGRAM can be unset or overridden.
    iterm_running = subprocess.run(
        ["pgrep", "-ax", "iTerm2"], capture_output=True,
    ).returncode == 0
    iterm_is_ancestor = iterm_running and subprocess.run(
        ["pgrep", "-x", "iTerm2"], capture_output=True,
    ).returncode != 0
    inside_iterm = os.environ.get("TERM_PROGRAM") == "iTerm.app" or iterm_is_ancestor

    if iterm_running and not inside_iterm:
        subprocess.run(["osascript", "-e", 'tell application "iTerm" to quit'])
        # Wait for iTerm2 to flush preferences and exit
        for _ in range(10):
            if subprocess.run(["pgrep", "-ax", "iTerm2"], capture_output=True).returncode != 0:
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


update_iterm2()
PYTHON
