{ pkgs, config, ... }:

{
  home.packages = with pkgs; [
    hyprpaper
  ];
  home.file.".config/hypr/hyprpaper.conf".text = ''
    preload = ~/.config/hypr/hyprpaper/nixos-1.png
    wallpaper = ,~/.config/hypr/hyprpaper/nixos-1.png
  '';
}
