#! /usr/bin/env bash

# Create iCloud Symlink
ln -s ~/Library/Mobile\ Documents/com\~apple\~CloudDocs ~/iCloud
chflags -h hidden ~/iCloud

# Create User Folder Symlinks
if [ -d ~/Dropbox/ ]; then
    mkdir -p ~/Dropbox/Desktop/   && sudo rm -rf ~/Desktop      && ln -s ~/Dropbox/Desktop/ ~/Desktop
    mkdir -p ~/Dropbox/Documents/ && sudo rm -rf ~/Documents    && ln -s ~/Dropbox/Documents/ ~/Documents
    mkdir -p ~/Dropbox/Downloads/ && sudo rm -rf ~/Downloads    && ln -s ~/Dropbox/Downloads/ ~/Downloads
    mkdir -p ~/Dropbox/Music/     && sudo rm -rf ~/Music/iTunes && ln -s ~/Dropbox/Music/ ~/Music/iTunes
    mkdir -p ~/Dropbox/Public/    && sudo rm -rf ~/Public       && ln -s ~/Dropbox/Public/ ~/Public
fi

# Cleanup Steps
rm ~/iCloud/com~apple~CloudDocs
chflags hidden ~/Music
