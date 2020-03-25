#!/usr/bin/env sh

# NOTE: Need to run `killall Dock` to refresh settings

echo "Disable press-and-hold for keys in favor of key repeat"
defaults write NSGlobalDomain ApplePressAndHoldEnabled -bool false

echo "Set a blazingly fast keyboard repeat rate"
defaults write NSGlobalDomain KeyRepeat -int 2 # lower = faster, 1 delta = 15ms, 2 = 30ms

echo "Set a shorter Delay until key repeat"
defaults write NSGlobalDomain InitialKeyRepeat -int 15 # lower = faster, 1 delta = 25ms, 15 = 225ms

echo "Make the dock autoshow after half a second"
# https://apple.stackexchange.com/questions/59556/is-there-a-way-to-completely-disable-dock
# float value is in seconds
defaults write com.apple.dock autohide-delay -float 0.5

echo "Disable swoosh animation when changing workspaces"
# https://osxdaily.com/2011/03/09/disable-the-spaces-animation-in-mac-os-x/
defaults write com.apple.dock workspaces-swoosh-animation-off -bool YES
