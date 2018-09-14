#! /usr/bin/env bash

# Install Command Line Binaries
echo "Installing Brews ..."
binaries=(
    bash
    ccat
    fish
    flac
    grc
    node
    pypy
    python
    python3
    git
    git-extras
    git-lfs
    shellcheck
    terminal-notifier
    thefuck
    tig
    trash
    tree
    websocketd
)
brew install "${binaries[@]}"
