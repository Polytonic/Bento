#! /usr/bin/env bash

# Create iCloud Symlink
ln -s ~/Library/Mobile\ Documents/com\~apple\~CloudDocs ~/iCloud
chflags -h hidden ~/iCloud

# Create User Folder Symlinks
# if [ -L ~/iCloud/ ]; then
#     mkdir -p ~/iCloud/Downloads/ && sudo rm -rf ~/Downloads && ln -s ~/iCloud/Downloads/ ~/Downloads
#     mkdir -p ~/iCloud/Music/ && sudo rm -rf ~/Music/iTunes && ln -s ~/iCloud/Music/ ~/Music/iTunes
# fi

# Cleanup Steps
rm ~/iCloud/com~apple~CloudDocs
# chflags hidden ~/Music
