#PROMPT="%B%F{247}[$USER%f%F{15}@$HOST%f %F{240}%2~%f%F{247}]$%f%b "
#PROMPT="$USER@$HOST %2~> "
#
function insert-mode () { echo "<INS>" }
function normal-mode () { echo "<NRM>" }

function preexec() {
	timer=$(( $(date +%s%0N) / 1000000 ))
}

function precmd() {
	if [ ${timer} ]; then
		now=$(( $(date +%s%0N) / 1000000 ))
		elapsed=$(( ${now} - ${timer} ))
		elapsed="${elapsed}"
		if [ ${elapsed} -ge 1000 ]; then
			elapsed=$(printf "%d\n" $(( ${elapsed} * 1.0 /1000 )))
			elapsed="${elapsed}s"
		else
			elapsed="${elapsed}ms"
		fi
		print -rP ""  # Add a new line for readability in the terminal
		print -rP "%n@%m (${elapsed}) %2~"
	else
		print -rP ""  # Add a new line for readability in the terminal
		print -rP "%n@%m (${elapsed}) %2~"
	fi
	unset timer
}

function set-prompt () {
    case ${KEYMAP} in
      (vicmd)      VI_MODE="$(normal-mode)" ;;
      (main|viins) VI_MODE="$(insert-mode)" ;;
      (*)          VI_MODE="$(insert-mode)" ;;
    esac
    PROMPT="$VI_MODE "
}

function zle-line-init zle-keymap-select {
	set-prompt
	zle reset-prompt
}

zle -N zle-line-init
zle -N zle-keymap-select
