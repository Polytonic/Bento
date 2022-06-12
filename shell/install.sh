#! /usr/bin/env zsh

# Determine Absolute Working Path
REPOSITORY_ROOT=$(git rev-parse --show-toplevel)

# Symlink Shell Profiles
ln -fs "${REPOSITORY_ROOT}/shell/.bashrc" "${HOME}/.bashrc"
echo "${HOME}/.bashrc -> ${REPOSITORY_ROOT}/shell/.bashrc"
ln -fs "${REPOSITORY_ROOT}/shell/.zshrc" "${HOME}/.zshrc"
echo "${HOME}/.zshrc -> ${REPOSITORY_ROOT}/shell/.zshrc"

# Powerline Installation
python3 -m pip install --upgrade pip
pip3 install powerline-status

# Fish Configuration
mkdir -p "${HOME}/.config/fish/"
ln -fs "${REPOSITORY_ROOT}/shell/config.fish" "${HOME}/.config/fish/config.fish"
echo "${HOME}/.config/fish/config.fish -> ${REPOSITORY_ROOT}/shell/config.fish"
