#
# ~/.bashrc
#

HISTCONTROL=erasedups
HISTSIZE=10000
HISTFILESIZE=-1

alias sudo='doas'
complete -F _root_command doas

alias vi='nvim'
alias ls='ls --color=auto'
alias ll='ls -lav --ignore=..'   # show long listing of all except ".."
alias l='ls -lav --ignore=.?*'   # show long listing but no hidden dotfiles except "."

set -o vi
## Created with $ _ Bash Prompt Generator
PS1='\[\e[38;5;202m\][\[\e[38;5;214m\]\u\[\e[0m\] \[\e[38;5;40;1m\]\W\[\e[0;38;5;202m\]]\[\e[38;5;214m\]\\$\[\e[0m\] '

[[ -z "$FUNCNEST" ]] && export FUNCNEST=100          # limits recursive functions, see 'man bash'

## Use the up and down arrow keys for finding a command in history
## (you can write some initial letters of the command first).
bind '"\e[A":history-search-backward'
bind '"\e[B":history-search-forward'
bind '"\C-l": clear;'
bind -x '"\C-q": . sessionizer-tmux'

stty -ixon # Disables ctrl-s and ctrl-q
shopt -s autocd

export TERM=xterm-256color
export EDITOR=nvim
export TERMINAL=alacritty
export PATH="$PATH:/home/mark/.local/bin"
