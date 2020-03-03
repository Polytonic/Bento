#! /usr/bin/env bash

# Install Command Line Binaries
echo "Installing Brews ..."
binaries=(
    bash
    ccat
    fish
    flac
    grc
    jq
    node
    pypy
    pypy3
    python
    python2
    git
    git-extras
    git-lfs
    shellcheck
    terminal-notifier
    tig
    trash
    tree
    websocketd
)
brew install "${binaries[@]}"
