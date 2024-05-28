#!/usr/bin/env bash

filename=$(date +%Y_%m_%d-%H_%M_%S)

if [[ "${1}" == "window" ]]; then
	hyprshot -o $HOME/pictures/screenshots/ -f "${filename}.png" -m window
elif [[ "${1}" == "region" ]]; then
	hyprshot -o $HOME/pictures/screenshots/ -f "${filename}.png" -m region
fi
