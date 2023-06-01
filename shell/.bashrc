# Determine Absolute Working Path
SHELL_PATH=$(dirname $(readlink -f ~/.bashrc))

# Set the Homebrew Path
eval "$(/opt/homebrew/bin/brew shellenv)"

# Load Aliases
source "${SHELL_PATH}/aliases.sh"

# Enable Terminal Command Coloring
GRC_ALIASES=true
[[ -s "/opt/homebrew/etc/grc.sh" ]] && source /opt/homebrew/etc/grc.sh

# Configure Powerline Prompt
powerline-daemon -q
POWERLINE_BASH_CONTINUATION=1
POWERLINE_BASH_SELECT=1
POWERLINE_HOME=$(pip show powerline-status | grep -E "^(?:Location: )(\S+)" | sed "s/.*[: ]//g")
source "${POWERLINE_HOME}/powerline/bindings/bash/powerline.sh"
