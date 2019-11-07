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
    contexts
    discord
    flume
    gfxcardstatus
    google-chrome
    google-hangouts
    # google-trends
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
    tower
    transmission
    visual-studio-code
    vlc
)
brew cask install "${apps[@]}"
