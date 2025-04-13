autoload edit-command-line; zle -N edit-command-line
autoload -U compinit promptinit
compinit
promptinit

echo
uname -a
uptime

eval "$(zoxide init --cmd cd zsh)"
