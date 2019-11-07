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

# Symlink Bartender Settings
killall "Bartender 3"
ln -Fs "$PWD/system/preferences/com.surteesstudios.Bartender.plist" ~/Library/Preferences/com.surteesstudios.Bartender.plist
open -a "Bartender 3"

# Symlink Contexts Settings
killall "Contexts"
ln -Fs "$PWD/system/preferences/com.contextsformac.Contexts.plist" ~/Library/Preferences/com.contextsformac.Contexts.plist

# Symlink iStat Menus Settings
ln -Fs "$PWD/system/preferences/com.bjango.istatmenus.plist" ~/Library/Preferences/com.bjango.istatmenus.plist
ln -Fs "$PWD/system/preferences/com.bjango.istatmenus.status.plist" ~/Library/Preferences/com.bjango.istatmenus.status.plist
ln -Fs "$PWD/system/preferences/com.bjango.istatmenus6.extras.plist" ~/Library/Preferences/com.bjango.istatmenus6.extras.plist
killall "iStatMenusAgent" "iStat Menus Status" "iStat Menus Notifications" "iStatMenusDaemon"

# Symlink Moom Settings
killall "Moom"
ln -Fs "$PWD/system/preferences/com.manytricks.Moom.plist" ~/Library/Preferences/com.manytricks.Moom.plist
open -a "Moom"

# Symlink Tower Settings
killall "Tower"
ln -Fs "$PWD/system/preferences/com.fournova.Tower3.plist" ~/Library/Preferences/com.fournova.Tower3.plist
