# Wrapper and alias for yazi
function y() {
	local tmp="$(mktemp -t "yazi-cwd.XXXXXX")"
	command yazi "$@" --cwd-file="${tmp}"
	if cwd="$(command cat -- "${tmp}")" && [ -n "${cwd}" ] && [ "${cwd}" != "${PWD}" ]; then
		builtin cd -- "${cwd}"
	fi
	command rm -f -- "${tmp}"
}

# Run applications in background without hogging stdout
function norun() {
	"$@" &> /dev/null &
}

# Git repos for single files
function gitf() {
	if [[ "${1}" == "--remove" ]] && [[ ! -z "${2}" ]]; then
		filename="${2}"
		if [[ -d ".${filename}.git" ]]; then
			filerepo=".${filename}.git"
		else
			filerepo="${XDG_DATA_HOME}/gitf/$(pwd | sed 's/\//%/g')%${filename}"
		fi
		rm -rf "${filerepo}"
		echo "Removed '${filerepo}' for file '${filename}'."
	else
		filename="${1}"
		shift
		if [[ -d ".${filename}.git" || ( "${1}" == "init" && "${2}" == "." ) ]]; then
			filerepo=".${filename}.git"
		else
			filerepo="${XDG_DATA_HOME}/gitf/$(pwd | sed 's/\//%/g')%${filename}"
		fi
		git --git-dir="${filerepo}" --work-tree=. "$@"
		if [[ "${1}" == "init" ]]; then
			echo -e "*\n!${filename}" > "${filerepo}/info/exclude"
		fi
	fi
}

# Updates the GPG agent to point to the correct TTY and uses the ssh kitten if kitty is installed on the client
function ssh() {
	command -v gpg-connect-agent &>/dev/null && gpg-connect-agent updatestartuptty /bye 2>/dev/null
	if [[ "$TERM" == "xterm-kitty" ]] && command -v kitty &>/dev/null; then
		kitty +kitten ssh "$@"
	else
		command ssh "$@"
	fi
}

# Terminal application launcher in a tmux session
function launch() {
	if tmux has-session -t "launcher" 2> /dev/null; then
		tmux send-keys -t "launcher:0.0" "$* &" ENTER
	else
		tmux new-session -d -s "launcher"
		tmux send-keys -t "launcher:0.0" "$* &" ENTER
	fi
}
