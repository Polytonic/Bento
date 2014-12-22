#!/usr/bin/env bash

# Install Homebrew
if test ! "$(which brew)"; then
    echo "Installing Homebrew"
    ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

# Update Homebrew
echo "Checking for Updates ..."
brew doctor
brew update

# Install Command Line Binaries
echo "Installing Binaries ..."
binaries=(
    fish
    flac
    hub
    node
    pypy
    python
    python3
    git
    git-extras
    grc
    terminal-notifier
    tig
)
brew install "${binaries[@]}"

# Install Application Binaries
echo "Installing Applications ..."
brew install caskroom/cask/brew-cask
brew tap caskroom/versions
apps=(
    bartender
    codekit
    dropbox
    gfxcardstatus
    google-chrome
    google-drive
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

# Cleanup Homebrew
echo "Cleaning Up Homebrew ..."
brew upgrade
brew prune
brew cleanup

# Download Thin-Client Installers
echo "Downloading Extras ..."
cd ~/Desktop
curl -O https://ccmdls.adobe.com/AdobeProducts/KCCC/1/osx10/CreativeCloudInstaller.dmg \
     -O http://dist.blizzard.com/downloads/bna-installers/322d5bb9ae0318de3d4cde7641c96425/retail.1/Battle.net-Setup-enUS.zip
cd -
