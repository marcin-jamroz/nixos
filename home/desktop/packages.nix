{ pkgs, ... }:

{
  home.packages = with pkgs; [
    grim
    slurp
    swaynotificationcenter
    pavucontrol
    hyprpaper
    (import ./scripts/task-waybar.nix { inherit pkgs; })
    (import ./scripts/list-hypr-bindings.nix { inherit pkgs; })
    (import ./scripts/screenshot.nix { inherit pkgs; })
    (import ./scripts/rofi-launcher.nix { inherit pkgs; })
    (import ./scripts/cpu-fan.nix { inherit pkgs; })
    (import ./scripts/gpu-fan.nix { inherit pkgs; })
  ];
}
