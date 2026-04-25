#! /usr/bin/env zsh
set -euo pipefail

# Determine Absolute Working Path
REPOSITORY_ROOT=$(git rev-parse --show-toplevel)

# Request Sudo Upfront
sudo -v
while true; do sudo -v; sleep 60; kill -0 "$$" || exit; done 2> /dev/null &
trap 'kill %1 2>/dev/null' EXIT INT TERM

# Symlink Git Configuration
if [ ! -L "${HOME}/.gitconfig" ]; then
    ln -fs "${REPOSITORY_ROOT}/.gitconfig" "${HOME}/.gitconfig"
fi

# Personalize Git Configuration (written to ~/.gitconfig.local, never committed)
LOCAL_GITCONFIG="${HOME}/.gitconfig.local"
if [ ! -f "${LOCAL_GITCONFIG}" ]; then
    touch "${LOCAL_GITCONFIG}"
    git config --file "${LOCAL_GITCONFIG}" core.excludesfile "${REPOSITORY_ROOT}/.gitignore"
    echo -n "Commit Author: " && read -r author
    git config --file "${LOCAL_GITCONFIG}" user.name "$author"
    echo -n "Commit Email: " && read -r email
    git config --file "${LOCAL_GITCONFIG}" user.email "$email"
fi

# System Preferences
source "${REPOSITORY_ROOT}/system/macos.sh"
source "${REPOSITORY_ROOT}/system/terminal.sh"
# Configure Dock on First Run Only
DOCK_SENTINEL="${HOME}/.config/bento/.dock-configured"
if [ ! -f "${DOCK_SENTINEL}" ]; then
    source "${REPOSITORY_ROOT}/system/dock.sh"
    mkdir -p "$(dirname "${DOCK_SENTINEL}")"
    touch "${DOCK_SENTINEL}"
fi
source "${REPOSITORY_ROOT}/system/finder.sh"

# Run Setup Scripts
source "${REPOSITORY_ROOT}/system/homebrew.sh"
source "${REPOSITORY_ROOT}/system/fonts.sh"
source "${REPOSITORY_ROOT}/shell/install.sh"
source "${REPOSITORY_ROOT}/sublime/install.sh"
