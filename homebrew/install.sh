#! /usr/bin/env bash

# Install Homebrew
export PATH="/usr/local/bin:/usr/local/sbin:$PATH"
if test ! "$(which brew)"; then
    echo "Installing Homebrew"
    ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)" < /dev/null
fi

# Update Homebrew
echo "Checking for Updates ..."
brew doctor
brew tap homebrew/cask
brew tap homebrew/cask-versions
brew tap homebrew/cask-fonts
brew update

# Install Bottles
source "homebrew/brews.sh"
source "homebrew/casks.sh"
source "homebrew/fonts.sh"

# Cleanup Homebrew
echo "Cleaning Up Homebrew ..."
brew cask upgrade
brew upgrade
brew cleanup
