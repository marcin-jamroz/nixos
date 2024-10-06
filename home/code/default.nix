{ config, pkgs, ...}: {
  imports = [
    ./packages.nix
    ./direnv.nix
  ];
}
