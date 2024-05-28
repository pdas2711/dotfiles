#!/usr/bin/env bash

config_dirs=("hypr" "nvim" "tmux" "zsh")

for config in "${config_dirs[@]}"; do
	rsync -av ${XDG_CONFIG_HOME}/${config} . --exclude .git
done
