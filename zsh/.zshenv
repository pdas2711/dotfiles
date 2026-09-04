# Environment Variables

# ZSH environment variables
skip_global_compinit=1  # Skip global compinit call since it will be called later on

# Basic XDG file paths
export XDG_DATA_HOME=${XDG_DATA_HOME:="$HOME/.local/share"}
export XDG_CACHE_HOME=${XDG_CACHE_HOME:="$HOME/.cache"}
export XDG_CONFIG_HOME=${XDG_CONFIG_HOME:="$HOME/.config"}
export XDG_STATE_HOME=${XDG_STATE_HOME:="$HOME/.local/state"}

# Additional application file paths
export CARGO_HOME="${XDG_DATA_HOME}/cargo"
export GNUPGHOME="${XDG_DATA_HOME}/gnupg"
export GOPATH="${XDG_DATA_HOME}/go"
export _JAVA_OPTIONS=-Djava.utils.prefs.userRoot="${XDG_CONFIG_HOME}/java"
export GDBHISTFILE="${XDG_STATE_HOME}/gdb/history"
export PARALLEL_HOME="${XDG_DATA_HOME}/parallel"
export WGETRC="${XDG_CONFIG_HOME}/wgetrc"
export PYTHONPYCACHEPREFIX="${XDG_CACHE_HOME}/python"
export PYTHONUSERBASE="${XDG_DATA_HOME}/python"
export TRASH="${XDG_DATA_HOME}/trash/files"
export TEXMFHOME="${XDG_CONFIG_HOME}/texmf"
export PATH="${PATH}:${HOME}/.local/bin:${XDG_DATA_HOME}/python"
export BASE16_TMUX_OPTION_ACTIVE=1

# Other environment variables
export GPG_TTY=$(tty)
export EDITOR="nvim"
export HYPRSHOT_DIR="${HOME}/media/pictures/screenshots/"
export PAGER=less LESS='-FR'
export MANPAGER='nvim +Man!'
export WORDCHARS=""
export SDL_VIDEODRIVER="wayland"
export GTK_THEME="Catppuccin-Mocha-Standard-Lavender-dark:dark"
export PATH=${PATH}:/var/lib/flatpak/exports/bin
export FZF_DEFAULT_OPTS="--preview 'cat {}'"

# Source Home Manager session variables
if [ -e "$HOME/.nix-profile/etc/profile.d/hm-session-vars.sh" ]; then
	. "$HOME/.nix-profile/etc/profile.d/hm-session-vars.sh"
fi
