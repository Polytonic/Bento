#! /usr/bin/env bash

# Install Command Line Binaries
echo "Installing Casks ..."
binaries=(
    ccat
    clang-format
    fish
    flac
    grc
    hub
    imagemagick
    node
    pypy
    python
    python3
    git
    git-extras
    shellcheck
    terminal-notifier
    tig
    tree
)
brew install "${binaries[@]}"
