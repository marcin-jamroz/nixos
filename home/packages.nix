{ pkgs, ... }:

{
  home.packages = with pkgs; [
    firefox
    file-roller
    qbittorrent
    vlc
    calibre
    libreoffice
    gedit
    android-tools
  ];
}
