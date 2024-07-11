{ config, pkgs, ...}: {
  imports = [
   # ./starship.nix
    ./kitty.nix
   # ./zsh.nix
    ./bash.nix
  ];
}
