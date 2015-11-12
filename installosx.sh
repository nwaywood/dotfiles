#!/usr/bin/env sh

echo "Disable press-and-hold for keys in favor of key repeat"
defaults write NSGlobalDomain ApplePressAndHoldEnabled -bool false

echo "Set a blazingly fast keyboard repeat rate"
defaults write NSGlobalDomain KeyRepeat -int 2 # lower = faster, 1 delta = 15ms, 2 = 30ms

echo "Set a shorter Delay until key repeat"
defaults write NSGlobalDomain InitialKeyRepeat -int 15 # lower = faster, 1 delta = 25ms, 15 = 225ms
