#! /usr/bin/env bash

# Write Google Chrome Settings
defaults write com.google.chrome AppleEnableSwipeNavigateWithScrolls -bool false

# Create a Microsoft User Data Folder
mkdir -p ~/Library/Preferences/Microsoft\ User\ Data/

# Install Alcatraz
curl -fsSL https://raw.github.com/supermarin/Alcatraz/master/Scripts/install.sh | sh

# Transmission Settings
defaults write org.m0k.transmission UseIncompleteDownloadFolder -bool true
defaults write org.m0k.transmission IncompleteDownloadFolder -string "${HOME}/Downloads"
defaults write org.m0k.transmission DownloadAsk -bool false
defaults write org.m0k.transmission DeleteOriginalTorrent -bool true
defaults write org.m0k.transmission WarningDonate -bool false
defaults write org.m0k.transmission WarningLegal -bool false

# Symlink Moom Settings
killall "Moom"
ln -Fs "$PWD/system/preferences/com.manytricks.Moom.plist" ~/Library/Preferences/com.manytricks.Moom.plist
open -a "Moom"

# Download Thin-Client Installers
echo "Downloading Extras ..."
cd ~/Desktop || exit
if [ ! -d /Applications/Adobe\ Creative\ Cloud/ ]; then
    curl -O -# https://ccmdls.adobe.com/AdobeProducts/KCCC/1/osx10/CreativeCloudInstaller.dmg
fi
if [ ! -d /Applications/Battle.net.app/ ]; then
    curl -O -# http://dist.blizzard.com/downloads/bna-installers/322d5bb9ae0318de3d4cde7641c96425/retail.1/Battle.net-Setup-enUS.zip
fi
if [ ! -d /Applications/Google\ Chrome.app/ ]; then
    curl -O -# https://dl.google.com/chrome/mac/stable/GGRO/googlechrome.dmg
fi
cd - > /dev/null || exit
