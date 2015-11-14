#! /usr/bin/env bash

# Fish Configuration
mkdir -p ~/.config/fish/
ln -fs "$PWD/fish/config.fish" ~/.config/fish/

# Update Shell Completions
fish -c fish_update_completions
