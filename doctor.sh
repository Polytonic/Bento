#! /usr/bin/env zsh
set -uo pipefail

# Determine Absolute Working Path
REPOSITORY_ROOT=$(git rev-parse --show-toplevel)

pass=0
warn=0
fail=0

pass()  { pass=$((pass + 1)); echo "  [OK] $1"; }
warn()  { warn=$((warn + 1)); echo "  [!!] $1"; }
fail()  { fail=$((fail + 1)); echo "  [FAIL] $1"; }

# ------------------------------------------------------------------
# Homebrew Health
# ------------------------------------------------------------------
echo ""
echo "Homebrew"
echo "--------"

if command -v brew &>/dev/null; then
    pass "Homebrew is installed"
else
    fail "Homebrew is not installed"
fi

# Stale taps: taps that are not used by any installed formula or cask
if command -v brew &>/dev/null; then
    stale_taps=()
    while IFS= read -r tap; do
        # Skip the core taps that Homebrew always needs
        [[ "$tap" == "homebrew/core" ]] && continue
        [[ "$tap" == "homebrew/cask" ]] && continue
        [[ "$tap" == "homebrew/bundle" ]] && continue

        # Check if any installed formula or cask comes from this tap
        tap_prefix="${tap}/"
        has_formula=false
        while IFS= read -r formula; do
            if [[ "$formula" == ${tap_prefix}* ]]; then
                has_formula=true
                break
            fi
        done < <(brew list --full-name 2>/dev/null)

        if ! $has_formula; then
            stale_taps+=("$tap")
        fi
    done < <(brew tap 2>/dev/null)

    if [[ ${#stale_taps[@]} -eq 0 ]]; then
        pass "No stale taps"
    else
        for tap in "${stale_taps[@]}"; do
            warn "Stale tap: $tap (brew untap $tap)"
        done
    fi

    # Outdated packages
    outdated=$(brew outdated --quiet 2>/dev/null)
    if [[ -z "$outdated" ]]; then
        pass "All packages are up to date"
    else
        count=$(echo "$outdated" | wc -l | tr -d ' ')
        warn "$count outdated package(s) (brew upgrade)"
    fi

    # Brew doctor issues
    doctor_output=$(brew doctor 2>&1)
    if [[ $? -eq 0 ]]; then
        pass "brew doctor reports no issues"
    else
        warn "brew doctor found issues (run brew doctor for details)"
    fi
fi

# ------------------------------------------------------------------
# Brewfile Sync
# ------------------------------------------------------------------
echo ""
echo "Brewfile"
echo "--------"

if [[ -f "${REPOSITORY_ROOT}/Brewfile" ]] && command -v brew &>/dev/null; then
    # Check for packages in Brewfile that are not installed
    missing=$(brew bundle check --file="${REPOSITORY_ROOT}/Brewfile" 2>&1)
    if [[ $? -eq 0 ]]; then
        pass "All Brewfile packages are installed"
    else
        warn "Missing Brewfile packages (brew bundle install)"
    fi

    # Check for installed packages not in the Brewfile
    cleanup_output=$(brew bundle cleanup --file="${REPOSITORY_ROOT}/Brewfile" 2>/dev/null)
    if [[ -z "$cleanup_output" ]]; then
        pass "No extra packages outside Brewfile"
    else
        extra_count=$(echo "$cleanup_output" | wc -l | tr -d ' ')
        warn "$extra_count package(s) installed but not in Brewfile (brew bundle cleanup)"
    fi
else
    [[ ! -f "${REPOSITORY_ROOT}/Brewfile" ]] && fail "Brewfile not found"
fi

# ------------------------------------------------------------------
# Symlinks
# ------------------------------------------------------------------
echo ""
echo "Symlinks"
echo "--------"

source "${REPOSITORY_ROOT}/system/symlinks.sh"

for entry in "${BENTO_SYMLINKS[@]}"; do
    link="${entry%%:*}"
    target="${entry#*:}"
    name=$(basename "$link")

    if [[ -L "$link" ]]; then
        actual=$(readlink "$link")
        if [[ "$actual" == "$target" ]]; then
            pass "$name -> $target"
        else
            warn "$name points to $actual (expected $target)"
        fi
    elif [[ -e "$link" ]]; then
        warn "$name exists but is not a symlink"
    else
        fail "$name is missing"
    fi
done

# ------------------------------------------------------------------
# Required Tools
# ------------------------------------------------------------------
echo ""
echo "Tools"
echo "-----"

required_tools=(
    bat
    cmake
    gh
    git
    git-lfs
    grc
    jq
    pipx
    pypy3
    python3
    starship
    trash
    virtualenv
)

for tool in "${required_tools[@]}"; do
    if command -v "$tool" &>/dev/null; then
        pass "$tool"
    else
        fail "$tool is not installed"
    fi
done

# ------------------------------------------------------------------
# Shell Configuration
# ------------------------------------------------------------------
echo ""
echo "Shell"
echo "-----"

# Check default shell
current_shell=$(dscl . -read ~/ UserShell 2>/dev/null | awk '{print $2}')
if [[ "$current_shell" == "/bin/zsh" ]]; then
    pass "Default shell is Zsh"
else
    warn "Default shell is $current_shell (expected /bin/zsh)"
fi

# ------------------------------------------------------------------
# Summary
# ------------------------------------------------------------------
echo ""
echo "---"
total=$((pass + warn + fail))
echo "$total checks: $pass passed, $warn warnings, $fail failures"
