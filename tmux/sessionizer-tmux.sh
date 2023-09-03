#!/usr/bin/env bash

# Origin From ThePrimeagen
# Credits to saccarosium on github

# Needed for true colors if not lauched direcly from bash
export TERM=xterm-256color

if [[ $# -eq 1 ]]; then
    # Adding support for simply pass the current working directory or a specified path
    selected="$1" && [[ "$selected" == '.' ]] && selected="$PWD"
else
    selected=$(find ~/Projects ~/.config /mnt/Ext4D/Manca/Game_Projects -mindepth 1 -maxdepth 1 -type d | fzf)
fi

[[ -z $selected ]] && exit 0

session_name=$(basename "$selected" | tr . _)

if [ -n "$TMUX" ]; then # If in tmux
    if ! tmux has-session -t "$session_name" 2>/dev/null; then
        tmux new-session -ds "$session_name" -c "$selected"
    fi
    tmux switch-client -t "$session_name"
elif [ -z "$TMUX" ]; then # If outside of tmux
    if ! tmux has-session -t "$session_name" 2>/dev/null; then
        tmux new-session -s "$session_name" -c "$selected"
        exit 0
    fi
    tmux attach -t "$session_name"
fi
