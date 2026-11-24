# Sourced by bootstrap.sh

# Install Homebrew
if ! command -v brew &>/dev/null; then
    NONINTERACTIVE=1 /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    eval "$(/opt/homebrew/bin/brew shellenv 2>/dev/null || /usr/local/bin/brew shellenv 2>/dev/null)"
fi

# Install Packages from Brewfile
brew bundle --file="${REPOSITORY_ROOT}/Brewfile"

# Secure Completion Directories
# compaudit should find no group- or other-writable completion directory or parent
homebrew_share="$(brew --prefix)/share"
for completion_directory in "${homebrew_share}" "${homebrew_share}/zsh" "${homebrew_share}/zsh-completions"; do
    [ -d "${completion_directory}" ] || continue
    if [ "${completion_directory}" = "${homebrew_share}" ]; then
        chmod go-w "${completion_directory}"
    else
        chmod -R go-w "${completion_directory}"
    fi 2>/dev/null || echo "[!!] Cannot remove group/other write permission from ${completion_directory}, compinit may report insecure directories"
done

# Cleanup Homebrew
brew doctor || true
brew cleanup
