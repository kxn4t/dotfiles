# dotfiles
## zsh
use [Starship](https://starship.rs/)  
<img src="https://user-images.githubusercontent.com/20788898/108704994-12500680-7550-11eb-8606-00e569985e64.png" width="540px">

## vim
use [Iceberg.vim](https://cocopon.github.io/iceberg.vim/)  
<img src="https://user-images.githubusercontent.com/20788898/108704477-6c040100-754f-11eb-9947-05d45b0714a7.png" width="540px">

## font
use `FiraMono Nerd Font Mono`  
*require: any [Nerd Fonts](https://www.nerdfonts.com/) font

## note
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
