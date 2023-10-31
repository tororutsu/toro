{
  description = "Toro's Flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-23.05";
    # Home Manager
    home-manager = {
      url = "github:nix-community/home-manager/release-23.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nvim-flake.url = "github:tororutsu/nvim-flake";
  };

  outputs = {
    self,
    nixpkgs,
    home-manager,
    nvim-flake,
    ...
  } @ inputs: let
    inherit (self) outputs;
  in {
    nixosConfigurations = {
      toro = nixpkgs.lib.nixosSystem {
	specialArgs = {inherit inputs outputs;};
	modules = [
          ./nixos/configuration.nix
	];
      };
    };
    homeConfigurations = {
      "rj@toro" = home-manager.lib.homeManagerConfiguration {
        pkgs = nixpkgs.legacyPackages.x86_64-linux;
	extraSpecialArgs = {inherit inputs outputs;};
	modules = [./home/home.nix];
      };
    };
  };
}
