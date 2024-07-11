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
  home.file.".blerc".text = ''
      bleopt indent_offset=10
      ble-bind -f up 'history-search-backward immediate-accept'
      ble-bind -f down 'history-search-forward immediate-accept'
    '';
}
