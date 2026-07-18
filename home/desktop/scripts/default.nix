{pkgs,...}:
{
  home.packages = [
    (import ./task-waybar.nix { inherit pkgs; })
    (import ./list-hypr-bindings.nix { inherit pkgs; })
    (import ./screenshot.nix { inherit pkgs; })
    (import ./rofi-launcher.nix { inherit pkgs; })
  ];
}