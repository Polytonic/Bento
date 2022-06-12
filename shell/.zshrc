# Determine Absolute Working Path
SHELL_PATH=$(dirname $(readlink -f .bashrc))

# Set the Homebrew Path
eval "$(/opt/homebrew/bin/brew shellenv)"

# Load Aliases
source "${SHELL_PATH}/aliases.sh"

# Enable Terminal Command Coloring
[[ -s "/etc/grc.zsh" ]] && source /etc/grc.zsh
