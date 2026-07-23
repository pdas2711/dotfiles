# Source Home Manager session variables
if [ -e "$HOME/.nix-profile/etc/profile.d/hm-session-vars.sh" ]; then
	. "$HOME/.nix-profile/etc/profile.d/hm-session-vars.sh"
fi


export ZDOTDIR=$HOME/.config/zsh
