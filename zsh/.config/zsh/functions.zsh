function norun() {
	"$@" &> /dev/null &
}

function note() {
	if [[ -z "${1}" ]]; then
		gopass edit -c notes/$(date +"%Y_%m_%d-%H_%M_%S").md
	else
		gopass edit -c notes/"${1}.md"
	fi
}

function gitf() {
	filename="${1}"
	filerepo="$(pwd | sed 's/\//%/g')%${filename}"
	if [[ ! -d "${XDG_DATA_HOME}/gitf/${filerepo}" ]]; then
		mkdir -p "${XDG_DATA_HOME}/gitf/${filerepo}"
		git init --bare "${XDG_DATA_HOME}/gitf/${filerepo}"
		echo -e "*\n!${filename}" > "${XDG_DATA_HOME}/gitf/${filerepo}/info/exclude"
	fi
	shift
	git --git-dir="${XDG_DATA_HOME}/gitf/${filerepo}" --work-tree=. "$@"
}
