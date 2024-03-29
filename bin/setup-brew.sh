#!/bin/bash

xcode-select --install
# - Maybe this supports Apple Silicon :)
# - Homebrew setup
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> ~/.zprofile
eval "$(/opt/homebrew/bin/brew shellenv)"

brew update
brew doctor
brew tap homebrew/cask-versions

# - Install
# -- Rosetta 2 (Apple Silicon)
sudo softwareupdate --install-rosetta

# -- language
# https://github.com/anyenv/anyenv
brew install anyenv
# https://docs.aws.amazon.com/corretto/latest/corretto-11-ug/macos-install.html
brew install corretto11

# -- shell
# brew install zsh # already installed in macOS
# https://github.com/zsh-users/zsh-completions
brew install zsh-completions
# https://github.com/zsh-users/zsh-syntax-highlighting/blob/master/INSTALL.md
brew install zsh-syntax-highlighting
# https://github.com/zsh-users/zsh-autosuggestions/blob/master/INSTALL.md
brew install zsh-autosuggestions
# https://starship.rs/ja-JP/
brew install starship
# -- util
brew install vim
brew install git
brew install peco
brew install ghq
brew install jq
brew install fd
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
