# Determine Absolute Working Path
REPOSITORY_ROOT=$(git rev-parse --show-toplevel)

# Set the Homebrew Path
eval "$(/opt/homebrew/bin/brew shellenv)"

# Load Aliases
source "${REPOSITORY_ROOT}/shell/aliases.sh"

# Enable Terminal Command Coloring
GRC_ALIASES=true
[[ -s "/etc/profile.d/grc.sh" ]] && source /etc/grc.sh

# Configure Powerline Prompt
powerline-daemon -q
POWERLINE_BASH_CONTINUATION=1
POWERLINE_BASH_SELECT=1
POWERLINE_HOME=$(pip show powerline-status | grep -E "^(?:Location: )(\S+)" | sed "s/.*[: ]//g")
source "${POWERLINE_HOME}/powerline/bindings/bash/powerline.sh"
