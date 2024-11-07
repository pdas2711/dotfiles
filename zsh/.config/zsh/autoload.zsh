autoload edit-command-line; zle -N edit-command-line
autoload -U compinit promptinit
compinit
promptinit; prompt gentoo

echo
uname -a
uptime

eval "$(zoxide init zsh)"
