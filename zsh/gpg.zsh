# Run GPG Agent
if [[ $(pgrep gpg-agent) == "" ]]; then
	eval "$(gpg-agent --daemon)"
fi
gpgconf --kill gpg-agent
export SSH_AUTH_SOCK=$(gpgconf --list-dirs agent-ssh-socket)
gpgconf --launch gpg-agent
gpg-connect-agent updatestartuptty /bye > /dev/null
