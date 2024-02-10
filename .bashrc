#
# ~/.bashrc
#

HISTCONTROL=erasedups
HISTSIZE=10000
HISTFILESIZE=-1

alias sudo='doas'
complete -F _root_command doas

alias ls='ls --color=auto'
alias ll='ls -lav --ignore=..'   # show long listing of all except ".."
alias l='ls -lav --ignore=.?*'   # show long listing but no hidden dotfiles except "."

set -o vi
PS1="\[\033[38;5;9m\][\[$(tput sgr0)\]\[\033[38;5;214m\]\u\[$(tput sgr0)\]\[\033[38;5;6m\]@\[$(tput sgr0)\]\[\033[38;5;38m\]\h\[$(tput sgr0)\] \[$(tput sgr0)\]\[\033[38;5;77m\]\w\[$(tput sgr0)\]\[\033[38;5;9m\]]\[$(tput sgr0)\]\[\033[38;5;214m\]\\$\[$(tput sgr0)\] \[$(tput sgr0)\]"

[[ -z "$FUNCNEST" ]] && export FUNCNEST=100          # limits recursive functions, see 'man bash'

## Use the up and down arrow keys for finding a command in history
## (you can write some initial letters of the command first).
bind '"\e[A":history-search-backward'
bind '"\e[B":history-search-forward'
bind '"\C-l": clear;'

stty -ixon #disables ctrl-s and ctrl-q
shopt -s autocd

export TERM=xterm-256color
export EDITOR=emacs
export TERMINAL=alacritty
export NVCC_PREPEND_FLAGS='-ccbin /usr/bin/g++-12' # Cuda needs gcc-12 currenly
