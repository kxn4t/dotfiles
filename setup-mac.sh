#!/bin/sh
# show hidden files
defaults write com.apple.finder AppleShowAllFiles true
# not create .DS_Store files in shared folders
defaults write com.apple.desktopservices DSDontWriteNetworkStores true

killall Finder
