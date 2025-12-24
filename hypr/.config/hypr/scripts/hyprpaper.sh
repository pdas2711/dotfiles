#!/usr/bin/env bash

# Wrapper script for hyprpaper

# Args:
# - monitors - delimited by commas and optionally set with a wallpaper using the '=' character (e.g. DP-1=wallpaper1.png).
# - cycle-time - how long in minutes the wallpapers will be applied before it gets cycled. If set to 0, cycling will not happen.
# If monitors are not set with a wallpaper, a wallpaper will be chosen randomly with each cycle. However, the '=' must be present.

function get_random_wallpaper() {
	wallpaper_list=$(ls ${WALLPAPER_DIR})
	rnd_index=$(seq 1 $(echo "${wallpaper_list}" | wc -l) | sort -R | head -n 1)
	wallpaper_select=$(echo "${wallpaper_list}" | sed -n ${rnd_index}p)
	printf "${wallpaper_select}"
}

function set_wallpaper() {
	hyprctl hyprpaper preload "${WALLPAPER_DIR}/${2}"
	hyprctl hyprpaper wallpaper "${1},${WALLPAPER_DIR}/${2}"
}

loop_monitor_args() {
	for (( i=1; i<=$(echo "${1}" | awk -F ',' '{print NF}'); i++ )); do
		monitor_arg=$(echo "${1}" | awk -F ',' -v mon="$i" '{print $mon}')
		monitor=$(echo "${monitor_arg}" | awk -F '=' '{print $1}')
		wallpaper=$(echo "${monitor_arg}" | awk -F '=' '{print $2}')
		if [[ -z "${wallpaper}" ]]; then
			wallpaper="$(get_random_wallpaper)"
		fi
		set_wallpaper "${monitor}" "${wallpaper}"
	done
}

# Terminate this instance if another instance is already running
if [[ $(pgrep -u $(whoami) -f "hyprpaper.sh" | wc -l) -gt 2 ]]; then
	echo "Another instance of this wrapper script is already running. Exiting."
	exit
fi

WALLPAPER_DIR=${WALLPAPER_DIR:="$XDG_CONFIG_HOME/hypr/wallpapers"}

# Delay for hyprpaper to start
sleep 3s

# Check Args
if [[ -z "${1}" ]] || [[ -z "${2}" ]]; then
	echo "Must pass at least monitors used and cycle time."
	exit
fi

# Loop every cycle time unless 0
if [[ ${2} -gt 0 ]]; then
	while :
	do
		loop_monitor_args "${1}"
		sleep ${2}m
		hyprctl hyprpaper unload all
	done
elif [[ ${2} -eq 0 ]]; then
	loop_monitor_args "${1}"
else
	echo "Invalid time '${2}'."
	exit
fi
