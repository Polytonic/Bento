#!/usr/bin/env bash

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
