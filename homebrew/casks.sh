#! /usr/bin/env bash

# Install Application Binaries
echo "Installing Casks ..."
apps=(
    airfoil
    alfred
    audio-hijack
    bartender
    battle-net
    contexts
    discord
    firefox
    flume
    gfxcardstatus
    google-chrome
    google-hangouts
    google-trends
    imageoptim
    iterm2
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
    sublime-merge
    tower
    vlc
)
brew cask install "${apps[@]}"
