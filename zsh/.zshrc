# Function completion lookups
fpath=(~/.config/zsh/completions $fpath)
fpath=(${(uo)fpath})

# Vim-style keybindings
autoload edit-command-line; zle -N edit-command-line
autoload -Uz compinit promptinit

# Globbing
setopt autocd extendedglob nomatch notify
unsetopt beep
bindkey -v

# The following lines were added by compinstall
zstyle :compinstall filename '$ZDOTDIR/.zshrc'

# Colors and menu interactive
autoload -U colors && colors
zstyle ':completion:*' menu select
zmodload zsh/complist
_comp_options+=(globdots)  # Include hidden files

# Start compinit and promptinit
compinit -d "${ZSH_COMPDUMP}" -C
promptinit

# Source custom files
for f ("${XDG_CONFIG_HOME}"/zsh/*.zsh) . $f

# Theme
source "${XDG_CONFIG_HOME}"/zsh/catppuccin_mocha-zsh-syntax-highlighting.zsh.config
