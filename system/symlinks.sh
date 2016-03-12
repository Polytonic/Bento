#! /usr/bin/env bash

# Create iCloud Symlink
ln -s ~/Library/Mobile\ Documents/com\~apple\~CloudDocs ~/iCloud
chflags -h hidden ~/iCloud

# Create User Folder Symlinks
mkdir -p ~/iCloud/Documents/ && sudo rm -rf ~/Documents && ln -s ~/iCloud/Documents/ ~/Documents
mkdir -p ~/iCloud/Downloads/ && sudo rm -rf ~/Downloads && ln -s ~/iCloud/Downloads/ ~/Downloads
mkdir -p ~/iCloud/Public/    && sudo rm -rf ~/Public    && ln -s ~/iCloud/Public/ ~/Public

# Cleanup Extra Symlink
rm ~/iCloud/com~apple~CloudDocs
