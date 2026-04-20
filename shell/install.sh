# Sourced by bootstrap.sh

# Symlink Shell Profiles
ln -fs "${REPOSITORY_ROOT}/shell/.zshrc" "${HOME}/.zshrc"
echo "${HOME}/.zshrc -> ${REPOSITORY_ROOT}/shell/.zshrc"
ln -fs "${REPOSITORY_ROOT}/shell/.zprofile" "${HOME}/.zprofile"
echo "${HOME}/.zprofile -> ${REPOSITORY_ROOT}/shell/.zprofile"

# Starship Prompt Configuration
mkdir -p "${HOME}/.config"
ln -fs "${REPOSITORY_ROOT}/shell/starship.toml" "${HOME}/.config/starship.toml"
echo "${HOME}/.config/starship.toml -> ${REPOSITORY_ROOT}/shell/starship.toml"
