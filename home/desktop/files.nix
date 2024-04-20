{ pkgs, config, ... }:

{
  home.file.".config/wlogout/icons" = {
    source = ./files/wlogout;
    recursive = true;
  };
  home.file.".config/swaylock-bg.jpg".source = ./files/swaylock-bg.jpg;
}
