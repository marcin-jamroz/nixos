{ pkgs, config, ... }:

{
  services.hypridle = {
    enable = true;
      
    lockCmd = "pidof hyprlock || hyprlock";
    beforeSleepCmd = "loginctl lock-session";
    afterSleepCmd = "hyprctl dispatch dpms on";
    
    listeners = [
      {
        timeout = 300;
        onTimeout = "loginctl lock-session";
      }
      {
        timeout = 330;
        onTimeout = "hyprctl dispatch dpms off";
        onResume = "hyprctl disptach dpms on";
      }
      {
        timeout = 1800;
        onTimeout = "systemctl suspend";
      }
    ];
  };
}
