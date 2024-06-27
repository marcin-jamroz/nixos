{ pkgs, config, username, host, ... }:

{
  home.packages = with pkgs; [
    firefox
    gnome.file-roller
    discord
    qbittorrent
    vlc
    calibre
    libreoffice
    gedit
  ];
}
