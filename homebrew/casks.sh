#! /usr/bin/env bash

# Install Application Binaries
echo "Installing Casks ..."
apps=(
    adobe-creative-cloud
    airfoil
    alfred
    bartender
    battle-net
    cleanmymac
    codekit
    discord
    dropbox
    endurance
    flume
    flux
    gfxcardstatus
    google-chrome
    google-drive
    hyperswitch
    google-hangouts
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
    sublime-text
    tower
    transmission
    vlc
)
brew cask install "${apps[@]}"

# Hide the /opt/ Directory
sudo chflags hidden /opt
