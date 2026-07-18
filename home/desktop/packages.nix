{config, pkgs, ... }:

{
  home.packages = with pkgs; [
    grim
    slurp
    swaynotificationcenter
    pavucontrol
  ];
}
