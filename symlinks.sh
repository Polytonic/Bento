#!/usr/bin/env bash

# Link Configuration Files
mkdir -p ~/Library/Application\ Support/Sublime\ Text\ 3/Packages/User/
mkdir -p ~/Library/Application\ Support/Sublime\ Text\ 3/Installed\ Packages/
cd ~/Library/Application\ Support/Sublime\ Text\ 3/Installed\ Packages/
curl -O --silent https://sublime.wbond.net/Package\ Control.sublime-package; cd -;
ln -fs "$PWD/sublime-preferences.json" ~/Library/Application\ Support/Sublime\ Text\ 3/Packages/User/Preferences.sublime-settings
ln -fs "$PWD/sublime-packages.json" ~/Library/Application\ Support/Sublime\ Text\ 3/Packages/User/Package\ Control.sublime-settings

mkdir -p ~/.config/fish/
ln -fs "$PWD/config.fish" ~/.config/fish/
ln -fs "$PWD/.gitconfig" ~/.gitconfig

# Update Shell Completions
fish -c fish_update_completions
