# Sourced by bootstrap.sh
# https://git.herrbischoff.com/awesome-macos-command-line/about/

# Create iCloud Symlink
ln -sf ~/Library/Mobile\ Documents/com\~apple\~CloudDocs ~/iCloud
chflags -h hidden ~/iCloud

# Sound Settings
defaults write com.apple.PowerChime ChimeOnAllHardware -bool true
defaults write com.apple.systemsound com.apple.sound.uiaudio.enabled -bool true
defaults write -g com.apple.sound.beep.feedback -bool true
defaults write -g com.apple.sound.beep.sound "/System/Library/Sounds/Submarine.aiff"

# Security and Privacy
sudo defaults write /Library/Preferences/com.apple.loginwindow LoginwindowText ""
sudo defaults write /Library/Preferences/com.apple.alf globalstate -bool true
defaults write com.apple.LaunchServices LSQuarantine -bool false

# Allow TouchID sudo Authentication
# Use sudo_local (survives macOS updates, unlike /etc/pam.d/sudo)
if [ ! -f "/etc/pam.d/sudo_local" ]; then
    sudo cp /etc/pam.d/sudo_local.template /etc/pam.d/sudo_local
fi
if ! grep -Fq "pam_tid.so" "/etc/pam.d/sudo_local"; then
    sudo sed -i "" '2i\
auth       sufficient     pam_tid.so
    ' "/etc/pam.d/sudo_local"
fi

# Disable File Sharing
sudo launchctl disable system/com.apple.smbd 2>/dev/null || true

# Network Settings
defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool true
defaults write com.apple.desktopservices DSDontWriteUSBStores -bool true
defaults write com.apple.NetworkBrowser BrowseAllInterfaces -bool true

# System Preferences
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

# Disable Click Desktop to Show Desktop
defaults write com.apple.WindowManager EnableStandardClickToShowDesktop -bool false

# Disable Window Tiling
defaults write com.apple.WindowManager EnableTilingByEdgeDrag -bool false
defaults write com.apple.WindowManager EnableTilingOptionAccelerator -bool false
defaults write com.apple.WindowManager EnableTopTilingByEdgeDrag -bool false

# Mac App Store
defaults write com.apple.SoftwareUpdate AutomaticCheckEnabled -bool true
defaults write com.apple.SoftwareUpdate AutomaticDownload -int 1
defaults write com.apple.SoftwareUpdate CriticalUpdateInstall -int 1
