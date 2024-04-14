{ config, pkgs, ... }:

{
  imports = [
    ./display-manager.nix
    ./nix-ld.nix
    ./packages.nix
  ];
}
