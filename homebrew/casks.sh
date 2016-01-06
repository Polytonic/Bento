#! /usr/bin/env bash

# Install Application Binaries
echo "Installing Casks ..."
apps=(
    bartender
    cleanmymac
    codekit
    dropbox
    flux
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
    skype
    steam
    sublime-text3
    tower
    transmission
    vlc
)
brew cask install "${apps[@]}"
