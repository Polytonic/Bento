#! /usr/bin/env bash

# Write Safari Settings
defaults write com.apple.Safari HomePage -string "http://usepanda.com/app/"
defaults write com.apple.Safari ProxiesInBookmarksBar "()"
defaults write com.apple.Safari FindOnPageMatchesWordStartsOnly -bool false
defaults write com.apple.Safari IncludeInternalDebugMenu -bool true
defaults write com.apple.Safari ShowFullURLInSmartSearchField -bool true
defaults write com.apple.Safari IncludeDevelopMenu -bool true
defaults write com.apple.Safari WebKitDeveloperExtrasEnabledPreferenceKey -bool true
defaults write com.apple.Safari com.apple.Safari.ContentPageGroupIdentifier.WebKit2DeveloperExtrasEnabled -bool true
defaults write com.apple.Safari com.apple.Safari.ContentPageGroupIdentifier.WebKit2BackspaceKeyNavigationEnabled -bool true
defaults write NSGlobalDomain WebKitDeveloperExtras -bool true

# Install Safari Tab Switching
if [ ! -d "/Library/Application Support/SIMBL/Plugins/SafariTabSwitching.bundle" ]; then
    open /opt/homebrew-cask/Caskroom/safari-tab-switching/1.2.7/Safari\ Tab\ Switching-1.2.7.pkg
fi

# Download Safari Extensions
echo "Downloading Safari Extensions"
cd ~/Desktop || exit
if [ ! -f ~/Library/Safari/Extensions/Minimal\ Status\ Bar.safariextz ]; then
    curl -O -# https://github.com/visnup/Minimal-Status-Bar/releases/download/v1.17/Minimal-Status-Bar-1.17.safariextz
fi
if [ ! -f ~/Library/Safari/Extensions/1Password.safariextz ]; then
    curl -O -# https://cache.agilebits.com/dist/1P/ext/1Password-4.4.2.safariextz
fi
if [ ! -f ~/Library/Safari/Extensions/uBlock.safariextz ]; then
    curl -O -# https://cloud.delosent.com/ublock-safari-0.9.5.0.safariextz
fi
cd - > /dev/null || exit
