#! /usr/bin/env bash

# Write Google Chrome Settings
defaults write com.google.chrome AppleEnableSwipeNavigateWithScrolls -bool false

# Create a Microsoft User Data Folder
mkdir -p ~/Library/Preferences/Microsoft\ User\ Data/

# Install Alcatraz
curl -fsSL https://raw.github.com/supermarin/Alcatraz/master/Scripts/install.sh | sh

# Transmission Settings
defaults write org.m0k.transmission UseIncompleteDownloadFolder -bool false
defaults write org.m0k.transmission IncompleteDownloadFolder -string "${HOME}/Downloads"
defaults write org.m0k.transmission DownloadAsk -bool false
defaults write org.m0k.transmission DeleteOriginalTorrent -bool true
defaults write org.m0k.transmission WarningDonate -bool false
defaults write org.m0k.transmission WarningLegal -bool false

# Symlink HyperSwitch Settings
killall "HyperSwitch"
ln -Fs "$PWD/system/preferences/com.bahoom.HyperSwitch.plist" ~/Library/Preferences/com.bahoom.HyperSwitch.plist
open -a "HyperSwitch"

# Symlink Moom Settings
killall "Moom"
ln -Fs "$PWD/system/preferences/com.manytricks.Moom.plist" ~/Library/Preferences/com.manytricks.Moom.plist
open -a "Moom"
