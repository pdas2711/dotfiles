function norun() {
	"$@" &> /dev/null &
}

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
