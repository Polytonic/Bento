#! /usr/bin/env bash

# Create iCloud Symlink
ln -s ~/Library/Mobile\ Documents/com\~apple\~CloudDocs ~/iCloud
chflags -h hidden ~/iCloud

# Create User Folder Symlinks
mkdir -p ~/iCloud/Documents/ && sudo rm -rf ~/Documents && ln -s ~/iCloud/Documents/ ~/Documents
mkdir -p ~/iCloud/Downloads/ && sudo rm -rf ~/Downloads && ln -s ~/iCloud/Downloads/ ~/Downloads
mkdir -p ~/iCloud/Public/    && sudo rm -rf ~/Public    && ln -s ~/iCloud/Public/ ~/Public

# Symlink the Dropbox Music Folder
if [ -d ~/Dropbox/iTunes/ ]; then
    sudo rm -rf ~/Music/iTunes
    ln -s ~/Dropbox/iTunes/ ~/Music/iTunes
    chflags hidden ~/Music
fi

# Cleanup Extra Symlink
rm ~/iCloud/com~apple~CloudDocs
