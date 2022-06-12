#! /usr/bin/env bash

# Determine Absolute Working Path
REPOSITORY_ROOT=$(git rev-parse --show-toplevel)

# Install Package Control
mkdir -p ~/Library/Application\ Support/Sublime\ Text/Installed\ Packages
cd "${HOME}/Library/Application Support/Sublime Text/Installed Packages" || exit
curl --silent -O "https://packagecontrol.io/Package%20Control.sublime-package"
mv "Package%20Control.sublime-package" "Package Control.sublime-package"
cd - > /dev/null || exit

# Symlink the User Folder
USER_FOLDER="${HOME}/Library/Application Support/Sublime Text/Packages/User"
if [ ! -d "${USER_FOLDER}" ]; then
    mkdir -p ~/Library/Application\ Support/Sublime\ Text/Packages/User
    ln -fs "${REPOSITORY_ROOT}/sublime/Package Control.sublime-settings" "${USER_FOLDER}/Package Control.sublime-settings"
    ln -fs "${REPOSITORY_ROOT}/sublime/Preferences.sublime-settings" "${USER_FOLDER}/Preferences.sublime-settings"
fi
