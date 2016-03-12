#! /usr/bin/env bash

# Install Package Control
mkdir -p ~/Library/Application\ Support/Sublime\ Text\ 3/Installed\ Packages/
cd ~/Library/Application\ Support/Sublime\ Text\ 3/Installed\ Packages/ || exit
curl -O --silent https://sublime.wbond.net/Package\ Control.sublime-package
cd - > /dev/null || exit

# Symlink the User Folder
if [ ! -d ~/Library/Application\ Support/Sublime\ Text\ 3/Packages/User ]; then
	mkdir -p ~/Library/Application\ Support/Sublime\ Text\ 3/Packages
    ln -s "$PWD/sublime" ~/Library/Application\ Support/Sublime\ Text\ 3/Packages/User
fi
