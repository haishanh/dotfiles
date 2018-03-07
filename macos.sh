#!/bin/bash

# Disable Slow Keys.
defaults write com.apple.universalaccess slowKey -int 0
# Disable press-and-hold for keys in favor of key repeat
defaults write NSGlobalDomain ApplePressAndHoldEnabled -bool false

# Set a blazingly fast keyboard repeat rate
defaults write NSGlobalDomain KeyRepeat -int 1
# defaults write NSGlobalDomain InitialKeyRepeat -int 35
defaults write NSGlobalDomain InitialKeyRepeat -int 30

# steal from https://github.com/mathiasbynens/dotfiles/blob/master/.macos
# Disable automatic termination of inactive apps
defaults write NSGlobalDomain NSDisableAutomaticTermination -bool true

defaults read NSGlobalDomain KeyRepeat -int
defaults read NSGlobalDomain InitialKeyRepeat -int
defaults read NSGlobalDomain ApplePressAndHoldEnabled -bool

# steal from https://github.com/mathiasbynens/dotfiles/blob/master/.macos
for app in "Activity Monitor" \
  "Address Book" \
  "Calendar" \
  "cfprefsd" \
  "Contacts" \
  "Dock" \
  "Finder" \
  "Google Chrome Canary" \
  "Google Chrome" \
  "Mail" \
  "Messages" \
  "Opera" \
  "Photos" \
  "Safari" \
  "SizeUp" \
  "Spectacle" \
  "SystemUIServer" \
  "Terminal" \
  "Transmission" \
  "Tweetbot" \
  "Twitter" \
  "iCal"; do
  killall "${app}" &> /dev/null
done

echo "Done. Note that some of these changes require a logout/restart to take effect."
