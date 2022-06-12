#! /usr/bin/env zsh

# Determine Absolute Working Path
REPOSITORY_ROOT=$(git rev-parse --show-toplevel)

# Personalize Git Configuration
if [ ! -f "${HOME}/.gitconfig" ]; then
    ln -fs "${REPOSITORY_ROOT}/.gitconfig" "${HOME}/.gitconfig"
    git config --global core.excludesfile "${REPOSITORY_ROOT}/.gitignore"
    if ! grep -q "name =" "${REPOSITORY_ROOT}/.gitconfig"; then
        echo -n "Commit Author: " && read author
        git config --global user.name "$author"
    fi
    if ! grep -q "email =" "${REPOSITORY_ROOT}/.gitconfig"; then
        echo -n "Commit Email: " && read email
        git config --global user.email "$email"
    fi
fi

# Request Sudo Upfront
sudo -v
while true; do sudo -v; sleep 60; kill -0 "$$" || exit; done 2> /dev/null &

# Run Setup Scripts
source system/homebrew.sh
source shell/install.sh
source sublime/install.sh

# System Preferences
source system/macos.sh
source system/terminal.sh
source system/dock.sh
source system/finder.sh
