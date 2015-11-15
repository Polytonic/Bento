#! /usr/bin/env bash

# Install Command Line Binaries
echo "Installing Brews ..."
binaries=(
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
    tig
    tree
)
brew install "${binaries[@]}"
