# Aliases

# Shell aliases
alias dateform='date +%Y%m%d_%H%M%S'
alias sudo='sudo '
alias ls='ls --color=auto -h --group-directories'
alias ll='ls -l'
alias ports='sudo lsof -i -P -n | grep "LISTEN"'
if [[ ! -z "$(command -v trash-cli)" ]]; then
	alias rm='trash-put'
fi
alias cleantex="rm -f *.aux *.log"
alias less='less -N --line-num-width=5'
alias rgpg='source ~/.config/zsh/keys_agent.zsh'
alias nvimr='nvim -R'
alias wake='ssh xwpi "sudo wake"'
alias wake-local='ssh xwpi-local "sudo wake"'
alias calendar='cal'

# Application-specific
alias hyprlock_restore="hyprctl --instance 0 'keyword misc:allow_session_lock_restore 1'; hyprctl --instance 0 'dispatch exec hyprlock'"
alias bluelight='wlsunset -t 1400 -T 1500'
alias hwin='hyprctl clients'
alias randpw='pwgen -cys 22 | awk "{print $1}"'
alias xotp='gopass otp -o otp/xansaware/pdas2711'
