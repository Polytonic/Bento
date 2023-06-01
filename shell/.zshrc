# Determine Absolute Working Path
SHELL_PATH=$(dirname $(readlink -f ~/.zshrc))

# Set the Homebrew Path
eval "$(/opt/homebrew/bin/brew shellenv)"

# Load Aliases
source "${SHELL_PATH}/aliases.sh"

# Enable Terminal Command Coloring
GRC_ALIASES=true
[[ -s "/etc/profile.d/grc.sh" ]] && source /etc/grc.sh

# Configure Powerline Prompt
POWERLINE_HOME=$(pip show powerline-status | grep -E "^(?:Location: )(\S+)" | sed "s/.*[: ]//g")
source "${POWERLINE_HOME}/powerline/bindings/zsh/powerline.zsh"
