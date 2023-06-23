#!/usr/bin/env bash

## Author : Aditya Shakya (adi1090x)
## Github : @adi1090x

# Current Theme
dir="$HOME/.config/rofi/powermenu/"
theme='style'

# CMDs
uptime="`uptime -p | sed -e 's/up //g'`"
host=`hostname`

# Options
shutdown=''
reboot=''
lock=''
suspend=''
logout=''

# Rofi CMD
rofi_cmd() {
	rofi -dmenu \
		-p "Visszlát ${USER}" \
		-mesg "Üzemidő: $uptime" \
		-theme ${dir}/${theme}.rasi
}

# Pass variables to rofi dmenu
run_rofi() {
	echo -e "$shutdown\n$reboot\n$lock\n$suspend\n$logout" | rofi_cmd
}

# Execute Command
run_cmd() {
	selected="$(confirm_exit)"
	if [[ "$selected" == "$yes" ]]; then
		if [[ $1 == '--shutdown' ]]; then
			loginctl poweroff
		elif [[ $1 == '--reboot' ]]; then
			loginctl reboot
		elif [[ $1 == '--lock' ]]; then
            swaylock 
		elif [[ $1 == '--suspend' ]]; then
			loginctl suspend
		elif [[ $1 == '--logout' ]]; then
			if [[ "$XDG_CURRENT_DESKTOP" == 'Hyprland' ]]; then
                hyprctl dispatch exit
			fi
		fi
	else
		exit 0
	fi
}


# Actions
chosen="$(run_rofi)"
case ${chosen} in
    $shutdown)
		run_cmd --shutdown
        ;;
    $reboot)
		run_cmd --reboot
        ;;
    $lock)
		run_cmd --lock
        ;;
    $suspend)
		run_cmd --suspend
        ;;
    $logout)
		run_cmd --logout
        ;;
esac
