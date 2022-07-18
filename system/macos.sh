#! /usr/bin/env bash

# Create iCloud Symlink
ln -s ~/Library/Mobile\ Documents/com\~apple\~CloudDocs ~/iCloud
chflags -h hidden ~/iCloud
rm /Users/kfung/iCloud/com~apple~CloudDocs

# Sound Settings
defaults write com.apple.PowerChime ChimeOnAllHardware -bool true
open /System/Library/CoreServices/PowerChime.app &
defaults write com.apple.systemsound com.apple.sound.uiaudio.enabled -bool true
defaults write -g com.apple.sound.beep.feedback -bool true
defaults write -g com.apple.sound.beep.sound "/System/Library/Sounds/Submarine.aiff"

# Security and Privacy
sudo defaults write /Library/Preferences/com.apple.loginwindow LoginwindowText ""
sudo defaults write /Library/Preferences/com.apple.alf globalstate -bool true
defaults write com.apple.LaunchServices LSQuarantine -bool false

# Network Settings
defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool true
defaults write com.apple.desktopservices DSDontWriteUSBStores -bool true
defaults write com.apple.NetworkBrowser BrowseAllInterfaces -bool true
defaults write com.apple.BluetoothAudioAgent "Apple Bitpool Max (editable)" 80
defaults write com.apple.BluetoothAudioAgent "Apple Bitpool Min (editable)" 80
defaults write com.apple.BluetoothAudioAgent "Apple Initial Bitpool (editable)" 80
defaults write com.apple.BluetoothAudioAgent "Apple Initial Bitpool Min (editable)" 80
defaults write com.apple.BluetoothAudioAgent "Negotiated Bitpool" 80
defaults write com.apple.BluetoothAudioAgent "Negotiated Bitpool Max" 80
defaults write com.apple.BluetoothAudioAgent "Negotiated Bitpool Min" 80

# System Preferences
defaults write com.apple.systempreferences NSQuitAlwaysKeepsWindows -bool false
defaults write -g AppleShowScrollBars -string "WhenScrolling"
defaults write -g AppleScrollerPagingBehavior -int 1
defaults write -g AppleInterfaceStyleSwitchesAutomatically -bool true
defaults write -g AppleKeyboardUIMode -int 3

# Expanded Save Panel Options
defaults write -g NSDocumentSaveNewDocumentsToCloud -bool false
defaults write -g NSNavPanelExpandedStateForSaveMode -bool true
defaults write -g NSNavPanelExpandedStateForSaveMode2 -bool true

# Require Screensaver Password
defaults write com.apple.screensaver askForPassword -int 1
defaults write com.apple.screensaver askForPasswordDelay -int 0

# Screen Capture PNGs
defaults write com.apple.screencapture type -string "png"

# Restore Scroll Direction
defaults write -g com.apple.swipescrolldirection -bool false

# Mac App Store
defaults write com.apple.SoftwareUpdate AutomaticCheckEnabled -bool true
defaults write com.apple.SoftwareUpdate AutomaticDownload -int 1
defaults write com.apple.SoftwareUpdate CriticalUpdateInstall -int 1
defaults write com.apple.SoftwareUpdate ScheduleFrequency -int 1
defaults write com.apple.commerce AutoUpdate -bool true
