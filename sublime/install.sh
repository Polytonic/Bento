# Sourced by bootstrap.sh

# Determine Absolute Working Path
REPOSITORY_ROOT="${REPOSITORY_ROOT:-$(git rev-parse --show-toplevel)}"

# Install Package Control
mkdir -p ~/Library/Application\ Support/Sublime\ Text/Installed\ Packages
curl --silent --fail -o "${HOME}/Library/Application Support/Sublime Text/Installed Packages/Package Control.sublime-package" \
    "https://packagecontrol.io/Package%20Control.sublime-package" || echo "Warning: Package Control download failed, skipping"

# Symlink Settings
USER_FOLDER="${HOME}/Library/Application Support/Sublime Text/Packages/User"
mkdir -p "${USER_FOLDER}"
ln -fs "${REPOSITORY_ROOT}/sublime/Package Control.sublime-settings" "${USER_FOLDER}/Package Control.sublime-settings"
ln -fs "${REPOSITORY_ROOT}/sublime/Preferences.sublime-settings" "${USER_FOLDER}/Preferences.sublime-settings"
