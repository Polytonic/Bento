#! /usr/bin/env bash

# Install Application Binaries
echo "Installing Casks ..."
apps=(
    alfred
    bartender
    cleanmymac
    codekit
    dropbox
    endurance
    flux
    gfxcardstatus
    google-drive
    hyperswitch
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

# Hide the /opt/ Directory
sudo chflags hidden /opt
