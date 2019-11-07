# Define Paths
set HOMEBREW /usr/local/bin
set -gx PATH $HOMEBREW $PATH
set -gx fish_greeting (set_color magenta)(date +"%A, %B %d, %Y at %r (%Z)")

# Define Aliases
alias cat="ccat"
alias pip="pip3"
alias python="pypy3"
alias rm="trash"
alias simulator="open /Applications/Xcode.app/Contents/Developer/Applications/Simulator.app"

# Enable Terminal Command Coloring
set -gx CLICOLOR 1

# Override Terminal Title and Set Prompt
function fish_title; echo $PWD | sed -e "s|^$HOME|~|" | tr -d "\n"; end
powerline-daemon -q
set POWERLINE_HOME (pip show powerline-status | grep -E "^(?:Location: )(\S+)" | sed "s/.*[: ]//g")
set fish_function_path $fish_function_path "$POWERLINE_HOME/powerline/bindings/fish"
powerline-setup

# Show Hidden Files and Extensions
function showhidden

    if [ $argv[1] = "true" ]
        defaults write com.apple.finder AppleShowAllFiles -bool $argv[1]
        defaults write NSGlobalDomain AppleShowAllExtensions -bool $argv[1]
        killall Finder

    else if [ $argv[1] = "false" ]
        defaults write com.apple.finder AppleShowAllFiles -bool $argv[1]
        defaults write NSGlobalDomain AppleShowAllExtensions -bool $argv[1]
        killall Finder

    else; echo "Invalid Option."
    end

end

