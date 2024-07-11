{ config, lib, pkgs, ... }:

{
  programs.bash = {
    enable = true;
    historyControl = [ "erasedups" "ignoredups"];
  };
  home.file.".blerc".text = ''
    bleopt indent_offset=10
    ble-bind -f up 'history-search-backward immediate-accept'
    ble-bind -f down 'history-search-forward immediate-accept'
    bind 'set completion-ignore-case on'
  '';
}
