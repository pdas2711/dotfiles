randpw() {
	if [[ "${*: -1:1}" == "" ]]; then
		echo "Pass length of password."
	elif [[ "${1}" == "--no-special" ]]; then
		< /dev/urandom tr -dc '1234567890ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz' | head -c${*: -1:1}; echo ""
	else
		< /dev/urandom tr -dc '1234567890!@#$%^&ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz' | head -c${1}; echo ""
	fi
}

norun() {
	"$@" &> /dev/null &
}
