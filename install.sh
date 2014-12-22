#!/usr/bin/env bash
sudo -v
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

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
brew cask install --appdir="/Applications" "${apps[@]}"

# Cleanup Homebrew
brew prune
brew cleanup

# Change the Default Login Shell
if [ "$SHELL" != "$(which fish)" ]; then
    if ! grep -q "$(which fish)" "/etc/shells"; then
        "$(which fish)" | sudo tee -a /etc/shells > /dev/null
    fi
    echo "Changing Login Shell"
    sudo chsh -s $(which fish)
fi
echo "Installation Complete!"
echo "Note: Some changes may require a restart in order to take effect."
