{ config, ...}:

{
  programs.waybar = {
    enable = true;
    settings = {
      mainBar = {
        layer = "top";
        modules-left = [ "hyprland/workspaces" "hyprland/window" "hyprland/language" "hyprland/submap" ];
        modules-center = [ "clock" ];
        modules-right = ["tray" "temperature" "cpu" "memory" "wireplumber" "bluetooth" "network" "group/group-power"];
        clock = {
          format-alt = "{:%a, %d. %b  %H:%M}";
        };
        "group/group-power" = {
          orientation = "vertical";
          drawer = {
            transition-duration = 500;
            children-class = "not-power";
            transition-left-to-right = false;
          };
          modules = [
            "custom/power" 
            "custom/quit"
            "custom/lock"
            "custom/reboot"
          ];
        };
"custom/quit" = {
    format = "󰗼";
    tooltip = false;
    on-click = "hyprctl dispatch exit";
};
"custom/lock" = {
    format = "󰍁";
    tooltip = false;
    on-click = "swaylock";
};
"custom/reboot" = {
    format = "󰜉";
    tooltip = false;
    on-click = "reboot";
};
"custom/power" = {
    format = "";
    tooltip = false;
    on-click = "shutdown now";
};
      };
    };
    # systemd.enable = true;
  };
}
