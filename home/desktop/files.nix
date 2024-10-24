{ ... }:

{
  home.file.".config/wlogout/icons" = {
    source = ./files/wlogout;
    recursive = true;
  };
  home.file.".config/hypr/hyprlock" = {
    source = ./files/hyprlock;
    recursive = true;
  };

}
