#!/usr/bin/env bash

# Origin From ThePrimeagen
# Credits to saccarosium on github

# Needed for true colors if not lauched direcly from bash
export TERM=xterm-256color

if [[ $# -eq 1 ]]; then
    # Adding support for simply pass the current working directory or a specified path
    selected="$1" && [[ "$selected" == '.' ]] && selected="$PWD"
else
    directories=$(find ~/.config -maxdepth 1 -type d)
    # Fix list concate with newline
    directories+=$'\n'$(find /mnt/Ext4D/Mark/Projektek/ /mnt/Ext4D/Mark/Projektek/Desktop/Gyakorlas/ /mnt/Ext4D/Mark/Projektek/Desktop/Iskola/ -mindepth 2 -maxdepth 2 -type d)
    selected=$(echo "$directories" | fzf)
fi

# Check if a valid selection is made
if [[ -z "$selected" ]]; then
    echo "No directory selected. Exiting."
    if [[ "$0" == "$BASH_SOURCE" ]]; then
        exit 1  # Exit if not sourced
    else
        return 1  # Return if sourced
    fi
fi

session_name=$(basename "$selected" | tr . _)

if [ -n "$TMUX" ]; then # If in tmux
    if ! tmux has-session -t "$session_name" 2>/dev/null; then
        tmux new-session -ds "$session_name" -c "$selected" "nvim"
    fi
    tmux switch-client -t "$session_name"
elif [ -z "$TMUX" ]; then # If outside of tmux
    if ! tmux has-session -t "$session_name" 2>/dev/null; then
        tmux new-session -s "$session_name" -c "$selected" "nvim"
        if [[ "$0" == "$BASH_SOURCE" ]]; then
            exit 0  # Exit if not sourced
        else
            return 0  # Return if sourced
        fi
    fi
    tmux attach -t "$session_name"
fi
