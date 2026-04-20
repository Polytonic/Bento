# Sourced by bootstrap.sh

# Terminal.app Settings
defaults write com.apple.terminal StringEncodings -array 4

# Skip Theme Installation on Subsequent Runs
theme=$(defaults read com.apple.terminal "Default Window Settings" 2>/dev/null)
if [[ "$theme" == "Periwinkle" ]]; then
    return
fi

# Install and Apply Terminal Theme
open "${REPOSITORY_ROOT}/system/themes/Periwinkle.terminal"
# Wait for Terminal.app to register the imported theme before setting it as default
sleep 1
defaults write com.apple.terminal "Default Window Settings" -string "Periwinkle"
defaults write com.apple.terminal "Startup Window Settings" -string "Periwinkle"
