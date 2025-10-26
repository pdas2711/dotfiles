# Basic XDG file paths

export XDG_DATA_HOME=${XDG_DATA_HOME:="$HOME/.local/share"}
export XDG_CACHE_HOME=${XDG_CACHE_HOME:="$HOME/.cache"}
export XDG_CONFIG_HOME=${XDG_CONFIG_HOME:="$HOME/.config"}
export XDG_DATA_DIRS="/var/lib/flatpak/exports/share:${XDG_DATA_HOME}/flatpak/exports/share"

# Additional application file paths

export CARGO_HOME="${XDG_DATA_HOME}/cargo"
export GNUPGHOME="${XDG_DATA_HOME}/gnupg"
export GOPATH="${XDG_DATA_HOME}/go"
export _JAVA_OPTIONS=-Djava.utils.prefs.userRoot="${XDG_CONFIG_HOME}/java"
export GDBHISTFILE="${XDG_CONFIG_HOME}/gdb/history"
export PARALLEL_HOME}="${XDG_DATA_HOME}/parallel"
export WGETRC="${XDG_CONFIG_HOME}/wgetrc"
export PYTHONPYCACHEPREFIX="${XDG_CACHE_HOME}/python"
export PYTHONUSERBASE="${XDG_DATA_HOME}/python"
export TRASH="${XDG_DATA_HOME}/Trash/files"
export TEXMFHOME="${XDG_CONFIG_HOME}/texmf"
export PATH="${PATH}:${HOME}/.local/bin:${XDG_DATA_HOME}/python"
export BASE16_TMUX_OPTION_ACTIVE=1

# Other environment variables

export GPG_TTY=$(tty)
export EDITOR="nvim"
export HYPRSHOT_DIR="${HOME}/pictures/screenshots/"
export GIT_REMOTE=~git/"users/pdas2711"
export PAGER=less LESS='-FR'
export WORDCHARS=""
