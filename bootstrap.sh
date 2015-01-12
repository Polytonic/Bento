#!/usr/bin/env bash

# Request Permission Upfront
sudo -v
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &
export PATH="/usr/local/sbin:$PATH"

# Secondary Scripts
source homebrew.sh
source symlinks.sh

# Personalize Git Configuration
git config --global core.excludesfile "$PWD/.gitignore"
if ! grep -q "name =" "$PWD/.gitconfig"; then
    echo -n "Commit Author: " && read author
    git config --global user.name "$author"
fi
if ! grep -q "email =" "$PWD/.gitconfig"; then
    echo -n "Commit Email: " && read email
    git config --global user.email "$email"
fi

# Change the Default Login Shell
if [ "$SHELL" != "$(which fish)" ]; then
    if ! grep -q "$(which fish)" "/etc/shells"; then
        which fish | sudo tee -a /etc/shells > /dev/null
    fi
    echo "Changing Login Shell ..."
    chsh -s "$(which fish)"
fi

# Notify the User
echo "Installation Complete!"
echo "Note: some changes may require a restart in order to take effect."
echo "This terminal will self-destruct in five seconds. Good luck $USER."
sleep 5; source macosx.sh; killall "Terminal";
