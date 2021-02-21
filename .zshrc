# ---- export ---------------------
export JAVA_HOME=/Library/Java/JavaVirtualMachines/amazon-corretto-11.jdk/Contents/Home
export PATH=/opt/homebrew/bin/git:$PATH

# ---- alias ---------------------
alias ll='ls -la'
alias ls='ls -G'
alias cp='cp -i'
alias mv='mv -i'
alias rm='rm -i'

# ---- other ---------------------
# zsh-completions
if type brew &>/dev/null; then
  FPATH=$(brew --prefix)/share/zsh-completions:$FPATH

  autoload -Uz compinit
  compinit
fi
# ignore case
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'

# zsh-syntax-highlighting
source /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# peco
function find_cd() {
  cd "$(find . -type d | peco)"
}
alias fc="find_cd"

# anyenv
eval "$(anyenv init -)"

