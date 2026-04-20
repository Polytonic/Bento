# Single source of truth for all symlinks managed by Bento.
# Sourced by doctor.sh and unlink.sh.
# Format: link_path:target_path

REPOSITORY_ROOT="${REPOSITORY_ROOT:-$(git rev-parse --show-toplevel)}"

BENTO_SYMLINKS=(
    "${HOME}/.zshrc:${REPOSITORY_ROOT}/shell/.zshrc"
    "${HOME}/.zprofile:${REPOSITORY_ROOT}/shell/.zprofile"
    "${HOME}/.config/starship.toml:${REPOSITORY_ROOT}/shell/starship.toml"
    "${HOME}/.gitconfig:${REPOSITORY_ROOT}/.gitconfig"
    "${HOME}/iCloud:${HOME}/Library/Mobile Documents/com~apple~CloudDocs"
    "${HOME}/Library/Application Support/Sublime Text/Packages/User/Package Control.sublime-settings:${REPOSITORY_ROOT}/sublime/Package Control.sublime-settings"
    "${HOME}/Library/Application Support/Sublime Text/Packages/User/Preferences.sublime-settings:${REPOSITORY_ROOT}/sublime/Preferences.sublime-settings"
)
