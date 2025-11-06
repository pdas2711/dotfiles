export SDL_VIDEODRIVER="wayland"
export GTK_THEME="Catppuccin-Mocha-Standard-Lavender-dark:dark"
export EDITOR=nvim
export PATH=${PATH}:/var/lib/flatpak/exports/bin

umask 077

# Set font if on a tty
if [[ $(tty | grep -o "tty") == "tty" ]]; then
	setfont -d
fi

# Tmux Session
if [[ ! -z "$(command -v cowsay)" ]]; then
	loginctl enable-linger
fi
tmux has -t main &> /dev/null
if [ $? != 0 ] && [[ "$@" == "" ]]; then
	tmux -2 new-session -s main -D -d
else

fi
if [ -z "$TMUX" ]; then  # If variable is empty, which happens when not in session
	if [[ $(tmux ls | grep "main:" | grep -o "(attached)") == "" ]]; then
		tmux attach -t main
	else
		tmux -2 new-session
	fi
fi
