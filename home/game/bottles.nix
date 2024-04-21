{ pkgs, config, username, host, ... }:

{
  home.packages = with pkgs; [
    bottles 
  ];
}
