#!/bin/zsh

# set vim colorscheme
mkdir -p ~/.vim/colors
mkdir ./iceberg
curl -L https://github.com/cocopon/iceberg.vim/archive/1.0.tar.gz | tar zx -C iceberg --strip-components 1
mv iceberg/colors/iceberg.vim ~/.vim/colors
rm -rf iceberg

# create a symbolic link
ln -snf "$(cd $(dirname $0) && pwd)/.zshrc" ~/
ln -snf "$(cd $(dirname $0) && pwd)/.zprofile" ~/
ln -snf "$(cd $(dirname $0) && pwd)/.vimrc" ~/

source ~/.zshrc
source ~/.zprofile
# zsh-completions
rm -f ~/.zcompdump; compinit
# when receive "zsh compinit: insecure directories" warnings
compaudit
# chmod -R go-w '/opt/homebrew/share/zsh'
# chmod -R go-w '/opt/homebrew/share'
