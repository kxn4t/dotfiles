#!/bin/bash

# - Maybe this supports Apple Silicon :)
# - Homebrew setup
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
brew update
brew doctor
brew tap homebrew/cask-versions

# - Install
# -- language
brew install anyenv
brew install corretto11
# -- shell
# brew install zsh # already installed in macOS
brew install zsh-completions
brew install zsh-syntax-highlighting
brew install starship
# -- util
brew install vim
brew install git
brew install peco
brew install ghq
brew install jq
# -- font
brew install homebrew/cask-fonts/font-fira-mono-nerd-font

# -- Application
brew install --cask google-chrome
brew install --cask google-japanese-ime
brew install --cask bettertouchtool
brew install --cask karabiner-elements
brew install --cask visual-studio-code
brew install --cask docker
brew install --cask iterm2
brew install --cask discord
brew install --cask slack
brew install --cask spotify
brew install --cask grammarly
brew install --cask mos

# - Setting
# -- anyenv
anyenv init
