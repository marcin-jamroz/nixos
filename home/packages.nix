{ pkgs, config, username, host, ... }:

{
  home.packages = with pkgs; [
    firefox
    file-roller
    discord
    qbittorrent
    vlc
    calibre
    libreoffice
    gedit
  ];
}
