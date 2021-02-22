# ---- export ---------------------
export JAVA_HOME=/Library/Java/JavaVirtualMachines/amazon-corretto-11.jdk/Contents/Home
export PATH=/opt/homebrew/bin/git:$PATH

# ---- alias ---------------------
alias ll='ls -la'
alias ls='ls -G'
alias cp='cp -i'
alias mv='mv -i'
alias rm='rm -i'
alias mkdir='mkdir -p'

# ---- zsh option ---------------------
# -- history --
# save location
HISTFILE=~/.zsh_history
# on memory size
HISTSIZE=1000
# on file size
SAVEHIST=100000
# share history between launched zsh
setopt share_history
# if the command is the same as the old one, delete the old
setopt hist_ignore_all_dups
# ignore history commands
setopt hist_no_store
# ignore the same command as the previous one
setopt hist_ignore_dups
# ignore the same command as the old
setopt hist_save_no_dups
# reduce unnecessary blank
setopt hist_reduce_blanks
# zsh sessions will append their history list to the history file, rather than replace it
setopt append_history

# -- other --
# reverse suggestion [shift + tab]
bindkey "\e[Z" reverse-menu-complete

# ---- other ---------------------
# -- zsh-completions --
if type brew &>/dev/null; then
  FPATH=$(brew --prefix)/share/zsh-completions:$FPATH

  autoload -Uz compinit
  compinit
fi
# ignore case suggestion
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'

# -- zsh-syntax-highlighting --
source /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# -- zsh-users/zsh-autosuggestions --
source /opt/homebrew/share/zsh-autosuggestions/zsh-autosuggestions.zsh

# -- peco --
# find history
# if enter the escape key, it will do nothing
function peco-select-history() {
  local select_history=$(history -n 1 | tail -r | peco --query "$LBUFFER")
  if [ -n "$select_history" ]; then
    BUFFER="$select_history"
    CURSOR=$#BUFFER
    zle reset-prompt
  fi
  zle reset-prompt
}
zle -N peco-select-history
bindkey '^R' peco-select-history

# -- anyenv --
eval "$(anyenv init -)"
# -- starship --
eval "$(starship init zsh)"
