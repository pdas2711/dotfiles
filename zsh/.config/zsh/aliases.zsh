# alias tmux='HISTFILE=$HISTFILE ~/scripts/tmux.sh'
#alias cdt='cd "$(tmux send-keys -t main "pwd" ENTER; tmux capture-pane -t main -p -S - | sed "/^$/d" | tail -n 2 | head -n 1)"'

alias ls='ls --color=auto -h --group-directories'
alias ll='ls -l'
alias ports='sudo lsof -i -P -n | grep "LISTEN"'
#alias tmux='~/.local/bin/scripts/s_tmux.sh'
alias r='ranger --choosedir=$HOME/.rangerdir; LASTDIR=`cat $HOME/.rangerdir`; cd "$LASTDIR"'
alias qtar='~/.local/bin/quicktar.sh'
alias rm='trash-put'
alias note='nvim ~/documents/notes/$(date +"%Y_%m_%d-%H_%M_%S").md'
alias cleantex="rm -f *.aux *.log"
alias camera='sudo /home/pdas2711/.local/bin/cam2ip'
alias exitt='hyprctl dispatch killactive; tmux kill-session -t main'
alias rzsh='source ${XDG_CONFIG_HOME}/zsh/.zshrc'
alias lschmod='stat -c "%a %n"'
alias dateform='date +%Y_%m_%d-%H_%M_%S'
alias pip='~/.local/share/python/bin/pip'
alias less='less -N --line-num-width=5'
alias rgpg='source ~/.config/zsh/keys_agent.zsh'
alias nft-reload='sudo cp /etc/nftables.conf /var/lib/nftables/rules-save; sudo rc-service nftables reload'
alias nvimr='nvim -R'
alias rhypr='touch ~/.config/hypr/hyprland.conf'
alias hwin='hyprctl clients'
alias randpw='pwgen -cys 22 | awk "{print $1}"'
