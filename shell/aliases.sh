# Define Aliases
alias sudo="sudo "
alias cat="ccat"
alias pip="pip3"
alias python="pypy3"
alias rm="trash"

# Open the iOS Simulator
alias simulator="open /Applications/Xcode.app/Contents/Developer/Applications/Simulator.app"

# Enable the macOS Firewall
alias firewall="sudo defaults write /Library/Preferences/com.apple.alf globalstate -bool true"

# Cycle the Wi-Fi Interface
alias wifi="sudo ifconfig en0 down && sudo ifconfig en0 up"

# Recursively Delete `.DS_Store` Files
alias cleanup="find . -type f -name '*.DS_Store' -ls -delete"

# Show Property List Contents
alias plist="/usr/libexec/PlistBuddy -c 'Print' "
