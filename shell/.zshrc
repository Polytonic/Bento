# Determine Absolute Working Path
SHELL_PATH=$(dirname "$(readlink -f ~/.zshrc)")

# Add pipx/local bin to PATH
export PATH="$HOME/.local/bin:$PATH"

# Set the Homebrew Path
eval "$(/opt/homebrew/bin/brew shellenv 2>/dev/null || /usr/local/bin/brew shellenv 2>/dev/null)"

# Load Aliases
source "${SHELL_PATH}/aliases.sh"

# Claude Code
export CLAUDE_CODE_EFFORT_LEVEL=max

# Enable Terminal Command Coloring
export CLICOLOR=1
export LSCOLORS="Gxfxcxdxbxegedabagacad"
export LS_COLORS="di=1;36:ln=35:so=32:pi=33:ex=31:bd=34;46:cd=34;43:su=30;41:sg=30;46:tw=30;42:ow=30;43"

GRC_ALIASES=true
[[ -s "${HOMEBREW_PREFIX}/etc/grc.zsh" ]] && source "${HOMEBREW_PREFIX}/etc/grc.zsh"

# Completions
FPATH="${HOMEBREW_PREFIX}/share/zsh-completions:$FPATH"
autoload -Uz compinit
compinit -C

zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
zstyle ':completion:*' menu select

# Configure Prompt
export STARSHIP_COMPUTER_NAME="$(scutil --get ComputerName 2>/dev/null || hostname -s)"
eval "$(starship init zsh)"

# Autosuggestions and Syntax Highlighting (must be after compinit and starship)
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=#787C99"
ZSH_AUTOSUGGEST_STRATEGY=(history completion)
source "${HOMEBREW_PREFIX}/share/zsh-autosuggestions/zsh-autosuggestions.zsh"
source "${HOMEBREW_PREFIX}/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"
