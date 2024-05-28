autoload edit-command-line; zle -N edit-command-line
bindkey '^e' edit-command-line
source /usr/share/autojump/autojump.zsh
autoload -U compinit promptinit
compinit
promptinit; prompt gentoo

echo
uname -a
uptime
