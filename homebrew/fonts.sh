#! /usr/bin/env bash

# Install Custom Fonts
echo "Installing Fonts ..."
fonts=(
    font-fira-code
    font-fira-sans
)
brew cask install "${fonts[@]}"
