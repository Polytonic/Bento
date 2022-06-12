# Determine Absolute Working Path
REPOSITORY_ROOT=$(git rev-parse --show-toplevel)

# Set the Homebrew Path
eval "$(/opt/homebrew/bin/brew shellenv)"

# Load Aliases
source "${REPOSITORY_ROOT}/shell/aliases.sh"

# Enable Terminal Command Coloring
[[ -s "/etc/grc.zsh" ]] && source /etc/grc.zsh
