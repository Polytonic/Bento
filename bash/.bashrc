# Define Aliases
alias cat="ccat"
alias pip="pip3"
alias python="pypy3"
alias rm="trash"
alias simulator="open /Applications/Xcode.app/Contents/Developer/Applications/Simulator.app"

# Enable Terminal Command Coloring
[[ -s "/usr/local/etc/grc.bashrc" ]] && source "/usr/local/etc/grc.bashrc"

# Configure Powerline Prompt
powerline-daemon -q
POWERLINE_BASH_CONTINUATION=1
POWERLINE_BASH_SELECT=1
POWERLINE_HOME=$(pip show powerline-status | grep -E "^(?:Location: )(\S+)" | sed "s/.*[: ]//g")
source "${POWERLINE_HOME}/powerline/bindings/bash/powerline.sh"
