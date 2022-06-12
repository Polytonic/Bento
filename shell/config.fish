# Set Homebrew Path
eval "$(/opt/homebrew/bin/brew shellenv)"

# Load Aliases
set ALIASES_PATH (dirname (realpath (status --current-filename)))
source "$ALIASES_PATH/aliases.sh"

# Enable Terminal Command Coloring
set -gx CLICOLOR 1

# Override Terminal Title and Set Prompt
set -gx fish_greeting (set_color magenta)(date +"%A, %B %d, %Y at %r (%Z)")
function fish_title; echo $PWD | sed -e "s|^$HOME|~|" | tr -d "\n"; end
powerline-daemon -q
set POWERLINE_HOME (pip show powerline-status | grep -E "^(?:Location: )(\S+)" | sed "s/.*[: ]//g")
set fish_function_path $fish_function_path "$POWERLINE_HOME/powerline/bindings/fish"
powerline-setup
