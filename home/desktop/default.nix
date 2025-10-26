{ ... }:

{
  imports = [
    ./hyprland.nix
    ./hyprlock.nix
    ./hypridle.nix
    ./hyprpaper.nix

    ./waybar.nix
    ./rofi.nix
    ./wlogout.nix
    ./swaync.nix
    ./gtk.nix

    ./packages.nix
    ./files.nix
  ];
}
