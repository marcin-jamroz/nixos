{ pkgs, config, username, host, ... }:

{
  home.packages = with pkgs; [
    firefox
    file-roller
    discord
    webcord
    qbittorrent
    vlc
    calibre
    libreoffice
    gedit
  ];
}
