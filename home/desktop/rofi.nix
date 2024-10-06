{ pkgs, ... }:

{
  programs.rofi = {
    enable = true;
    package = pkgs.rofi-wayland;
    theme = "Arc-Dark";
    extraConfig = {
      modes = "window,drun,run,combi";
      combi-modes = "window,drun,run";
    };

  };
}
