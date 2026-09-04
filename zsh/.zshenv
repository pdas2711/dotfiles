# Skip global compinit call since it will be called later on
skip_global_compinit=1

# Source Home Manager session variables
if [ -e "$HOME/.nix-profile/etc/profile.d/hm-session-vars.sh" ]; then
	. "$HOME/.nix-profile/etc/profile.d/hm-session-vars.sh"
fi

export ZDOTDIR=$HOME/.config/zsh
