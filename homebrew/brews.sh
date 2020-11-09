#! /usr/bin/env bash

# Install Command Line Binaries
echo "Installing Brews ..."
binaries=(
    bash
    ccat
    fish
    flac
    git
    git-extras
    git-lfs
    grc
    jq
    logitech-camera-settings
    node
    pypy
    pypy3
    python
    python2
    shellcheck
    terminal-notifier
    tig
    trash
    tree
    websocketd
)
brew install "${binaries[@]}"
