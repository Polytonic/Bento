#! /usr/bin/env bash

# Install Application Binaries
echo "Installing Casks ..."
apps=(
    adobe-creative-cloud
    alfred
    bartender
    battle-net
    cleanmymac
    codekit
    discord
    dropbox
    endurance
    flux
    gfxcardstatus
    google-chrome
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
    sublime-text
    tower
    transmission
    vlc
)
brew cask install "${apps[@]}"

# Hide the /opt/ Directory
sudo chflags hidden /opt
