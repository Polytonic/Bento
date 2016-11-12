#! /usr/bin/env bash

# Permissions Check
sudo chown -R $(whoami) "/usr/local"

# Install Homebrew
export PATH="/usr/local/bin:/usr/local/sbin:$PATH"
if test ! "$(which brew)"; then
    echo "Installing Homebrew"
    ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)" < /dev/null
fi

# Update Homebrew
echo "Checking for Updates ..."
brew doctor
brew tap caskroom/cask
brew tap caskroom/versions
brew tap caskroom/fonts
brew tap homebrew/binary
brew tap homebrew/dupes
brew update

# Install Bottles
source "homebrew/brews.sh"
source "homebrew/casks.sh"
source "homebrew/fonts.sh"

# Cleanup Homebrew
echo "Cleaning Up Homebrew ..."
brew upgrade
brew prune
brew cleanup
brew cask cleanup
