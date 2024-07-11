{ config, pkgs, ... }:

{
  imports = [
    ./display-manager.nix
    ./nix-ld.nix
    ./packages.nix
    ./services.nix
    ./steam.nix
    ./polkit.nix
    ./thunar.nix
    ./graphics.nix
    ./amd-gpu.nix
    ./virtualisation.nix
    ./shell.nix
   # ./flatpak.nix
  ];
}
