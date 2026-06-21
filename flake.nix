{
  description = "A simple NixOS flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    nixpkgs-master.url = "github:NixOS/nixpkgs/master";

    home-manager = {
      url = "github:nix-community/home-manager/master";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    stylix.url = "github:danth/stylix";
  };

  outputs =
    {
      self,
      nixpkgs,
      nixpkgs-master,
      home-manager,
      ...
    }@inputs:
    let
      system = "x86_64-linux";
      username = "marcin-jamroz";

      overlay-master = final: prev: {
        master = import nixpkgs-master {
          inherit system;
          config.allowUnfree = true;
        };
      };
    in
    {
      nixosConfigurations.${username} = nixpkgs.lib.nixosSystem {
        specialArgs = {
          inherit system;
          inherit inputs;
          inherit username;
        };
        modules = [
          # Overlays-module makes "pkgs.unstable" available in configuration.nix
          (
            { ... }:
            {
              nixpkgs.overlays = [
                overlay-master
              ];
            }
          )
          # Import the previous configuration.nix we used,
          # so the old configuration file still takes effect
          ./system
          # make home-manager as a module of nixos
          # so that home-manager configuration will be deployed automatically when executing `nixos-rebuild switch`
          inputs.stylix.nixosModules.stylix
          home-manager.nixosModules.home-manager
          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.backupFileExtension = "backup";
            home-manager.extraSpecialArgs = {
              inherit inputs;
              inherit username;
            };
            home-manager.users.${username} = import ./home;
          }
        ];
      };
    };
}
