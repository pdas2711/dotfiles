{
	description = "Home Manager configuration of pdas2711";
	inputs = {
		nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
		home-manager = {
			url = "github:nix-community/home-manager";
			inputs.nixpkgs.follows = "nixpkgs";
		};
	};

	outputs = { nixpkgs, home-manager, ... }: {
		homeConfigurations."pdas2711" = home-manager.lib.homeManagerConfiguration {
			system = "x86_64-linux";
			pkgs = nixpkgs.legacyPackages.${system};
			modules = [ ./users/pdas2711/home.nix ];
		};
	};
}
