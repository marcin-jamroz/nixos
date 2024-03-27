{ config, pkgs, ...}: {
  imports = [
    ./starship.nix
    ./kitty.nix
    ./bash.nix
  ];
}
