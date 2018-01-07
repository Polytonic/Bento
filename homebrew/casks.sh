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
    cleanmymac
    codekit
    contexts
    discord
    flume
    flux
    gfxcardstatus
    google-backup-and-sync
    google-chrome
    google-hangouts
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
