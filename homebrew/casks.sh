#! /usr/bin/env bash

# Install Application Binaries
echo "Installing Casks ..."
apps=(
    bartender
    caffeine
    cleanmymac
    codekit
    dropbox
    gfxcardstatus
    google-chrome-canary
    google-drive
    imageoptim
    istat-menus
    kaleidoscope
    launchrocket
    league-of-legends
    qlcolorcode
    qlmarkdown
    qlstephen
    safari-tab-switching
    skype
    steam
    sublime-text3
    tower
    transmission
    vlc
)
brew cask install "${apps[@]}"
