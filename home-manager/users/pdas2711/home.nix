{ config, pkgs, ... }: {
	# User Information and State Version
	home.username = "pdas2711";
	home.homeDirectory = "/home/pdas2711";
	home.stateVersion = "24.11";

	# User Packages
	home.packages = with pkgs; [
		nodejs
	];
	
	# Source Dotfiles
	home.file = {
	};
	
	# User Environment Variables
	home.sessionVariables = {
	};

	# Let Home Manager install and manage itself.
	programs.home-manager.enable = true;
}
