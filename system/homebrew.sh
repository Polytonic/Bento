# Sourced by bootstrap.sh

# Install Homebrew
if ! command -v brew &>/dev/null; then
    NONINTERACTIVE=1 /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    eval "$(/opt/homebrew/bin/brew shellenv 2>/dev/null || /usr/local/bin/brew shellenv 2>/dev/null)"
fi

# Install Packages from Brewfile
brew bundle --file="${REPOSITORY_ROOT}/Brewfile"

# Cleanup Homebrew
brew doctor || true
brew cleanup
