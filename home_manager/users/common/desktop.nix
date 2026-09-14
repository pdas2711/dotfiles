{ pkgs, ... }: {
	# Catppuccin Theming
	catppuccin = {
		enable = true;
		autoEnable = true;
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
