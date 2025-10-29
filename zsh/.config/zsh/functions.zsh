norun() {
	"$@" &> /dev/null &
}

function note() {
	if [[ -z "${1}" ]]; then
		gopass edit -c notes/$(date +"%Y_%m_%d-%H_%M_%S").md
	else
		gopass edit -c notes/"${1}.md"
	fi
}
