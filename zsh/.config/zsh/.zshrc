# Lines configured by zsh-newuser-install
HISTFILE=~/.config/zsh/history
HISTSIZE=1000
SAVEHIST=1000
setopt autocd extendedglob nomatch notify
unsetopt beep
bindkey -v
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '$ZDOTDIR/.zshrc'

autoload -U colors && colors
autoload -Uz compinit
zstyle ':completion:*' menu select
zmodload zsh/complist
compinit
_comp_options+=(globdots)  # Include hidden files
# End of lines added by compinstall

# Source custom files
for f ($ZDOTDIR/*.zsh) . $f

# Theme
source "$ZDOTDIR"/catppuccin_mocha-zsh-syntax-highlighting.zsh.config


# Syntax highlighting (must be at end of file)
source /usr/share/zsh/site-functions/zsh-syntax-highlighting.zsh
