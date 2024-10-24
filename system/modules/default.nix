{ ... }:

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
    ./programs.nix
    ./stylix.nix
  ];
}
