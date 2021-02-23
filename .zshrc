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
# search branch
alias -g B='`git branch | peco --prompt "branch>"| sed -e "s/^\*[ ]*//g"`'

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
# automatically append trailing "/"" in directory name completion
setopt auto_param_slash

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

# find ghq list and cd
## - for keybind
# function peco-cd-ghq-src() {
#     local repo=$(ghq list | peco --prompt 'ghq list>' --query "$LBUFFER")
#     if [ -n "$repo" ]; then
#         repo=$(ghq list --full-path --exact $repo)
#         BUFFER="cd ${repo}"
#         zle accept-line
#     fi
#     zle clear-screen
# }
# zle -N peco-cd-ghq-src
# bindkey '^]' peco-cd-ghq-src
## - for alias
function peco-cd-ghq-src() {
  local repo=$(ghq list | peco --prompt 'ghq list>')
  if [ -n "$repo" ]; then
    cd $(ghq list --full-path --exact $repo)
  fi
}
alias fg="peco-cd-ghq-src"

# insert directory path at cursor position
function peco-insert-directory() {
  local dir="$(fd --type directory --hidden --no-ignore --exclude .git/ --color never 2>/dev/null | peco --prompt 'directory>')"
  if [ -n "$dir" ]; then
    dir=$(echo "$dir" | tr -d '\n') # remove line break
    dir=$(printf %q "$dir") # escape
    BUFFER="${LBUFFER}${dir}${RBUFFER}"
    CURSOR=$#BUFFER
  fi
}
zle -N peco-insert-directory
bindkey '^Xf' peco-insert-directory

# insert file path at cursor position
function peco-insert-file() {
  local file="$(fd --type file --hidden --no-ignore --exclude .git/ --color never 2>/dev/null | peco --prompt 'file>')"
  if [ -n "$file" ]; then
    file=$(echo "$file" | tr -d '\n') # remove line break
    file=$(printf %q "$file") # escape
    BUFFER="${LBUFFER}${file}${RBUFFER}"
    CURSOR=$#BUFFER
  fi
}
zle -N peco-insert-file
bindkey '^X^f' peco-insert-file

# -- anyenv --
eval "$(anyenv init -)"
# -- starship --
eval "$(starship init zsh)"
