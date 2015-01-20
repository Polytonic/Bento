#!/usr/bin/env bash

# Install Homebrew
export PATH="/usr/local/bin:/usr/local/sbin:$PATH"
if test ! "$(which brew)"; then
    echo "Installing Homebrew"
    ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)" < /dev/null
fi

# Update Homebrew
echo "Checking for Updates ..."
brew doctor
brew install caskroom/cask/brew-cask
brew tap caskroom/versions
brew update

# Install Application Binaries
echo "Installing Applications ..."
apps=(
    bartender
    codekit
    dropbox
    flashlight
    gfxcardstatus
    google-chrome-canary
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
    tinkertool
    tower
    transmission
    vlc
)
brew cask install "${apps[@]}"

# Install Command Line Binaries
echo "Installing Binaries ..."
binaries=(
    fish
    flac
    hub
    imagemagick
    node
    pypy
    python
    python3
    git
    git-extras
    shellcheck
    terminal-notifier
    tig
)
brew install "${binaries[@]}"

# Install Custom Fonts
echo "Installing Fonts"
brew tap caskroom/fonts
fonts=(
    font-fira-sans
)
brew cask install "${fonts[@]}"

# Cleanup Homebrew
echo "Cleaning Up Homebrew ..."
brew upgrade
brew prune
brew cleanup
brew cask cleanup

# Download Thin-Client Installers
echo "Downloading Extras ..."
cd ~/Desktop
if [ ! -d /Applications/Adobe\ Creative\ Cloud/ ]; then
    curl -O -# https://ccmdls.adobe.com/AdobeProducts/KCCC/1/osx10/CreativeCloudInstaller.dmg
fi
if [ ! -d /Applications/Battle.net.app/ ]; then
    curl -O -# http://dist.blizzard.com/downloads/bna-installers/322d5bb9ae0318de3d4cde7641c96425/retail.1/Battle.net-Setup-enUS.zip
fi
if [ ! -d /Applications/Google\ Chrome.app/ ]; then
    curl -O -# https://dl.google.com/chrome/mac/stable/GGRO/googlechrome.dmg
fi
cd -