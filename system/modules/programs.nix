{ pkgs, ... }:

{
  programs = {
    fuse.userAllowOther = true;
    mtr.enable = true;
    coolercontrol.enable = true;
    hyprland = {
      enable = true;
      withUWSM = true;
      package = pkgs.master.hyprland;
    };
  };
}
