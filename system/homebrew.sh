#! /usr/bin/env zsh

# Install Homebrew
NONINTERACTIVE=1 /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# Homebrew Taps
brew tap homebrew/cask
brew tap homebrew/cask-drivers
brew tap homebrew/cask-versions
brew tap homebrew/cask-fonts

# Command Line Binaries
binaries=(
    bash
    ccat
    fish
    git
    git-extras
    git-lfs
    grc
    jq
    pypy3
    python
    trash
)

# Applications
apps=(
    1password
    brave-browser
    contexts
    discord
    firefox
    google-chrome
    iterm2
    kaleidoscope
    monitorcontrol
    rocket
    sublime-text
    tower
)

# Custom Fonts
fonts=(
    font-fira-code
    font-fira-sans
)

# Install Homebrew Packages
brew install "${binaries[@]}"
brew install "${apps[@]}"
brew install "${fonts[@]}"

# Cleanup Homebrew
brew doctor
brew cleanup
