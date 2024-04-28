{ pkgs, config, ... }:

{
  imports = [
    ./hyprland.nix
    ./hyprlock.nix
    ./hyprpaper.nix
    
    ./waybar.nix
    ./rofi.nix
    ./wlogout.nix
    ./swaylock.nix
    ./swaync.nix
    ./gtk-qt.nix

    ./packages.nix
    ./files.nix
  ];
}
