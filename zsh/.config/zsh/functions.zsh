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
		filerepo="$(pwd | sed 's/\//%/g')%${filename}"
		rm -rf "${XDG_DATA_HOME}/gitf/${filerepo}"
		echo "Removed '${filerepo}' for file '${filename}'."
	else
		filename="${1}"
		filerepo="$(pwd | sed 's/\//%/g')%${filename}"
		shift
		git --git-dir="${XDG_DATA_HOME}/gitf/${filerepo}" --work-tree=. "$@"
		if [[ "${1}" == "init" ]]; then
			echo -e "*\n!${filename}" > "${XDG_DATA_HOME}/gitf/${filerepo}/info/exclude"
		fi
	fi
}
