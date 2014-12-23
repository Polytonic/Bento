#!/usr/bin/env bash

TERM_PROFILE="Periwinkle";
CURRENT_PROFILE="$(defaults read com.apple.terminal "Default Window Settings")";
if [ "$CURRENT_PROFILE" != "$TERM_PROFILE" ]; then
    open "$PWD/$TERM_PROFILE.terminal"; sleep 1;
    defaults write com.apple.terminal "Default Window Settings" -string "$TERM_PROFILE";
    defaults write com.apple.terminal "Startup Window Settings" -string "$TERM_PROFILE";
    defaults import com.apple.Terminal "$HOME/Library/Preferences/com.apple.Terminal.plist"
fi;
