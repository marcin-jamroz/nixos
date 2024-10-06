{ pkgs, config, username, host, ... }:

{
  home.packages = with pkgs; [
    mangohud
    discord
    vesktop
    protonup-qt
  ];
}
