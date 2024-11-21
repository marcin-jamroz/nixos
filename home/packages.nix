{ pkgs, ... }:

{
  home.packages = with pkgs; [
    firefox
    file-roller
    qbittorrent
    vlc
    master.calibre
    libreoffice
    gedit
    brave
    android-tools
  ];
}
