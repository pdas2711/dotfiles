{ pkgs, ... }: {
	# Catppuccin Theming
	catppuccin = {
		enable = true;
		autoEnable = true;
	};

	# Cursor Theming
	home.pointerCursor = {
		enable = true;
		name = "catppuccin-mocha-blue-cursors";
		package = pkgs.catppuccin-cursors.mochaBlue;
		size = 24;
		gtk.enable = true;
	};

	# Notification daemon
	services.mako = {
		enable = true;
		settings = {
			default-timeout = 5000;
			font = "monospace 14";
		};
	};

	# Desktop packages
	home.packages = with pkgs; [
		libnotify
	];
}
