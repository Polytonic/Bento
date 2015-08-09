#!/usr/bin/env bash

# Set Terminal.app Default Profile
TERM_PROFILE="Periwinkle";
CURRENT_PROFILE="$(defaults read com.apple.terminal "Default Window Settings")";
if [ "$CURRENT_PROFILE" != "$TERM_PROFILE" ]; then
    open "$PWD/$TERM_PROFILE.terminal"; sleep 1;
    defaults write com.apple.terminal "Default Window Settings" -string "$TERM_PROFILE";
    defaults write com.apple.terminal "Startup Window Settings" -string "$TERM_PROFILE";
    defaults import com.apple.terminal "$HOME/Library/Preferences/com.apple.terminal.plist"
fi;

# Mute the Startup Chime
sudo nvram SystemAudioVolume=" "

# Enable the Power Chime
defaults write com.apple.PowerChime ChimeOnAllHardware -bool true
open /System/Library/CoreServices/PowerChime.app &

# Disable the Guest User
sudo defaults write /Library/Preferences/com.apple.loginwindow GuestEnabled -bool false

# Enable the Firewall
sudo defaults write /Library/Preferences/com.apple.alf globalstate -int 1

# Write Global Settings
defaults write NSGlobalDomain AppleHighlightColor -string "0.968627 0.831373 1.000000"
defaults write NSGlobalDomain AppleShowScrollBars -string "WhenScrolling"
defaults write NSGlobalDomain AppleKeyboardUIMode -int 3
defaults write NSGlobalDomain NSDocumentSaveNewDocumentsToCloud -bool false
defaults write NSGlobalDomain com.apple.swipescrolldirection -bool false
defaults write com.apple.systemsound com.apple.sound.beep.sound /System/Library/Sounds/Submarine.aiff

# Write Dock Settings
defaults write com.apple.dock autohide -bool true
defaults write com.apple.dock mouse-over-hilite-stack -bool true
defaults write com.apple.dock use-new-list-stack -bool true
defaults write com.apple.dock minimize-to-application -bool true
defaults write com.apple.dock mru-spaces -bool false
defaults write com.apple.dock showhidden -bool true
defaults write com.apple.dock mineffect -string "suck"
defaults write com.apple.dock wvous-bl-corner -int 5
defaults write com.apple.dock wvous-bl-modifier -int 1048576
defaults write com.apple.dock wvous-br-corner -int 4
defaults write com.apple.dock wvous-br-modifier -int 1048576
defaults write com.apple.dock wvous-tl-corner -int 10
defaults write com.apple.dock wvous-tl-modifier -int 1048576
defaults write com.apple.dock wvous-tr-corner -int 12
defaults write com.apple.dock wvous-tr-modifier -int 0

# Write Finder Settings
defaults write com.apple.finder NewWindowTarget -string "PfLo"
defaults write com.apple.finder NewWindowTargetPath -string "file://$HOME/"
defaults write com.apple.finder ShowExternalHardDrivesOnDesktop -bool true
defaults write com.apple.finder ShowHardDrivesOnDesktop -bool false
defaults write com.apple.finder ShowMountedServersOnDesktop -bool true
defaults write com.apple.finder ShowRemovableMediaOnDesktop -bool true
defaults write com.apple.finder ShowStatusBar -bool true
defaults write com.apple.finder ShowPathbar -bool true
defaults write com.apple.finder QLEnableTextSelection -bool true
defaults write com.apple.finder FXEnableExtensionChangeWarning -bool false
defaults write com.apple.finder FXDefaultSearchScope -string "SCcf"
defaults write com.apple.finder FXPreferredViewStyle -string "clsv"

# Write Google Chrome Settings
defaults write com.google.chrome AppleEnableSwipeNavigateWithScrolls -bool false

# Create a Microsoft User Data Folder
mkdir -p ~/Library/Preferences/Microsoft\ User\ Data/

# Install Alcatraz
curl -fsSL https://raw.github.com/supermarin/Alcatraz/master/Scripts/install.sh | sh

# Download Safari Extensions
echo "Downloading Safari Extensions"
cd ~/Desktop
if [ ! -f ~/Library/Safari/Extensions/Minimal\ Status\ Bar.safariextz ]; then
    curl -O -# https://github.com/visnup/Minimal-Status-Bar/releases/download/v1.17/Minimal-Status-Bar-1.17.safariextz
fi
if [ ! -f ~/Library/Safari/Extensions/1Password.safariextz ]; then
    curl -O -# https://cache.agilebits.com/dist/1P/ext/1Password-4.4.2.safariextz
fi
if [ ! -f ~/Library/Safari/Extensions/uBlock.safariextz ]; then
    curl -O -# https://cloud.delosent.com/ublock-safari-0.9.5.0.safariextz
fi
cd -
