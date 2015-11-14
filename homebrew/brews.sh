#! /usr/bin/env bash

# Install Application Binaries
echo "Installing Brews ..."
apps=(
    bartender
    caffeine
    cleanmymac
    codekit
    dropbox
    flashlight
    gfxcardstatus
    gitup
    google-chrome-canary
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
    safari-tab-switching
    skype
    steam
    sublime-text3
    tinkertool
    tower
    totalfinder
    turbo-boost-switcher
    transmission
    vlc
    vox-preferences-pane
)
brew cask install "${apps[@]}"
