#!/usr/local/bin/zsh

# set vim colorscheme
mkdir ~/.vim/colors
mkdir ./iceberg
curl -L https://github.com/cocopon/iceberg.vim/archive/1.0.tar.gz | tar zx -C iceberg --strip-components 1
mv iceberg/colors/iceberg.vim ~/.vim/colors
rm -rf iceberg

# create a symbolic link
ln -snf "$(cd $(dirname $0) && pwd)/.zshrc" ~/
ln -snf "$(cd $(dirname $0) && pwd)/.zprofile" ~/
ln -snf "$(cd $(dirname $0) && pwd)/.vimrc" ~/