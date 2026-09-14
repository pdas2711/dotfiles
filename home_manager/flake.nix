{
	description = "Home Manager configuration of pdas2711";
	inputs = {
		nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
		home-manager = {
			url = "github:nix-community/home-manager";
			inputs.nixpkgs.follows = "nixpkgs";
		};
		catppuccin.url = "github:catppuccin/nix";

	};

	outputs = { nixpkgs, home-manager, ... }@inputs: {
		homeConfigurations."pdas2711" = home-manager.lib.homeManagerConfiguration rec {
			pkgs = nixpkgs.legacyPackages."x86_64-linux";
			modules = [
				inputs.catppuccin.homeModules.catppuccin
				./users/pdas2711/home.nix
			];
		};
	};
}
