#! /usr/bin/env bash

# Install Custom Fonts
echo "Installing Fonts ..."
fonts=(
    font-fira-sans
    font-fira-mono
    font-fira-mono-for-powerline
)
brew cask install "${fonts[@]}"
