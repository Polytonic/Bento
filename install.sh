#!/usr/bin/env bash

sudo -v
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &
export PATH="/usr/local/sbin:$PATH"

# Secondary Scripts
source homebrew.sh
source symlinks.sh

# Personalize Git Configuration
echo -n "Commit Author: " && read author
echo -n "Commit Email: " && read email
git config --global user.name "$author"
git config --global user.email "$email"
git config --global core.excludesfile "$PWD/.gitignore"

# Change the Default Login Shell
if [ "$SHELL" != "$(which fish)" ]; then
    if ! grep -q "$(which fish)" "/etc/shells"; then
        which fish | sudo tee -a /etc/shells > /dev/null
    fi
    echo "Changing Login Shell ..."
    sudo chsh -s "$(which fish)"
fi

# Notify the User
echo "Installation Complete!"
echo "Note: some changes may require a restart in order to take effect."
