{ ... }: {
	# Repopulate XDG_DATA_DIRS in the hm-session-vars script
	xdg.systemDirs = {
		data = [
			"$HOME/.nix-profile/share"
			"/var/lib/flatpak/exports/share"
			"$HOME/.local/share/flatpak/exports/share"
			"/usr/local/share"
			"/usr/share"
		];
		config = [ "/etc/xdg" ];
	};
}
