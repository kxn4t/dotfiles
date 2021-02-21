# dotfiles
I use the Apple Silicon version of Homebrew, so the path may be different.

e.g.  
.zshrc:
- Apple Silicon: `source /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh`
- Intel: `source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh`


## Setup
If you do not follow this order, it will not work.  
It is better to perform the installation with Homebrew if necessary.
```
$ sh setup-mac.sh
$ sh setup-brew.sh
$ sh setup-git.sh
$ sh setup-rc.sh
$ sh setup-anyenv.sh
```
