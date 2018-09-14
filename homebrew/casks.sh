#! /usr/bin/env bash

# Install Application Binaries
echo "Installing Casks ..."
apps=(
    adobe-creative-cloud
    airfoil
    alfred
    audio-hijack
    bartender
    battle-net
    codekit
    contexts
    discord
    flume
    gfxcardstatus
    google-backup-and-sync
    google-chrome
    google-hangouts
    google-trends
    imageoptim
    istat-menus
    kaleidoscope
    launchrocket
    loopback
    qlcolorcode
    qlmarkdown
    qlstephen
    rocket
    steam
    sublime-text
    tower
    transmission
    vlc
)
brew cask install "${apps[@]}"
