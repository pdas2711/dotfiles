# alias tmux='HISTFILE=$HISTFILE ~/scripts/tmux.sh'
#alias cdt='cd "$(tmux send-keys -t main "pwd" ENTER; tmux capture-pane -t main -p -S - | sed "/^$/d" | tail -n 2 | head -n 1)"'

alias dateform='date +%Y_%m_%d-%H_%M_%S'
alias sudo='sudo '
alias ls='ls --color=auto -h --group-directories'
alias ll='ls -l'
alias ports='sudo lsof -i -P -n | grep "LISTEN"'
alias r='ranger --choosedir=$HOME/.rangerdir; LASTDIR=`cat $HOME/.rangerdir`; cd "$LASTDIR"'
alias qtar='~/.local/bin/quicktar.sh'
if [[ ! -z "$(command -v trash-cli)" ]]; then
	alias rm='trash-put'
fi
alias cleantex="rm -f *.aux *.log"
alias rzsh='source ${XDG_CONFIG_HOME}/zsh/.zshrc'
alias lschmod='stat -c "%a %n"'
alias pip='~/.local/share/python/bin/pip'
alias less='less -N --line-num-width=5'
alias rgpg='source ~/.config/zsh/keys_agent.zsh'
alias nvimr='nvim -R'
alias hwin='hyprctl clients'
alias randpw='pwgen -cys 22 | awk "{print $1}"'
alias xotp='gopass otp -o otp/xansaware/pdas2711'
alias wake='ssh xansawarejb "sudo wake"'
