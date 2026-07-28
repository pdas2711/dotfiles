# Umask rw-------
umask 077

# Set font if on a tty
if [[ $(tty | grep -o "tty") == "tty" ]]; then
	setfont -d
fi

# Login Lingering
if [[ ! -z "$(command -v loginctl)" ]]; then
	loginctl enable-linger
fi

# Dynamic Tmux Main Session
if [[ -z "$TMUX" ]] && (( $+commands[tmux] )); then
	session_target="main"
	if tmux has-session -t "${session_target}" 2>/dev/null; then
		local -a session_info
		session_info=(${(f)$(tmux list-sessions -F '#{session_name} #{session_attached}' 2>/dev/null)})
		local is_attached=0
		for line in ${session_info}; do
			local name=${${line}:0:${#session_target}}
			local session_status=${line##* }
			if [[ "${name}" == "${session_target}" ]]; then
				is_attached=${session_status}
				break
			fi
		done
		if [[ "${is_attached}" == "0" ]]; then
			tmux attach-session -t "${session_target}"
		else
			tmux new-session
		fi
	else
		tmux new-session -s "${session_target}"
	fi
fi
