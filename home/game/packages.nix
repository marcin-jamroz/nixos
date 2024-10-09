{ pkgs, ... }:

{
  home.packages = with pkgs; [
    mangohud
    discord
    vesktop
    protonup-qt
    phoronix-test-suite
  ];
}
