# Startup tasks for the shell prompt

echo
uname -a
uptime

if [[ ! -z "$(command -v cowsay)" ]] && [[ ! -z "$(command -v python)" ]]; then
	$(dirname "$0")/random-select.py | cowsay
fi

eval "$(zoxide init --cmd cd zsh)"
