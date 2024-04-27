{ pkgs, config, ... }:

{
  imports = [
    ./hyprland.nix
    ./waybar.nix
    ./rofi.nix
    ./wlogout.nix
    ./swaylock.nix
    ./swaync.nix
    ./gtk-qt.nix
    ./hyprpaper.nix

    ./packages.nix
    ./files.nix
  ];
}
