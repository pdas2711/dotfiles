{ config, pkgs, ... }: {
	# Set default applications
	xdg = {
		configFile."mimeapps.list".force = true;
		mimeApps = {
			enable = true;
			defaultApplications = {
				"text/html" = "brave.desktop";
				"x-scheme-handler/http" = "brave.desktop";
				"x-scheme-handler/https" = "brave.desktop";
			};
		};
	};

	# Let Home Manager install and manage itself.
	programs.home-manager.enable = true;
}
