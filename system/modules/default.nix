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
    ./opengl.nix
    ./amd-gpu.nix
    ./virtualisation.nix
   # ./flatpak.nix
  ];
}
