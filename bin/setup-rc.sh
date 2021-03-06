#!/bin/zsh

# set vim colorscheme
mkdir -p ~/.vim/colors
mkdir ./iceberg
curl -L https://github.com/cocopon/iceberg.vim/archive/1.0.tar.gz | tar zx -C iceberg --strip-components 1
mv iceberg/colors/iceberg.vim ~/.vim/colors
rm -rf iceberg

# create a symbolic link
ln -snf "$(cd $(dirname $0) && cd .. && pwd)/.zshrc" ~/
ln -snf "$(cd $(dirname $0) && cd .. && pwd)/.zprofile" ~/
ln -snf "$(cd $(dirname $0) && cd .. && pwd)/.vimrc" ~/
mkdir ~/.config
ln -snf "$(cd $(dirname $0) && cd .. && pwd)/starship.toml" ~/.config/starship.toml

source ~/.zshrc
source ~/.zprofile
# zsh-completions
rm -f ~/.zcompdump; compinit
# when receive "zsh compinit: insecure directories" warnings
compaudit
# chmod -R go-w '/opt/homebrew/share/zsh'
# chmod -R go-w '/opt/homebrew/share'

# change default shell
sudo sh -c "echo '/opt/homebrew/bin/zsh' >> /etc/shells"
chsh -s /opt/homebrew/bin/zsh
