{ pkgs, config, inputs, ... }:

{
  programs = {
    hyprland.enable = true;
    fuse.userAllowOther = true;
    mtr.enable = true;
  };
}
