{ config, ...}: 

{
   wayland.windowManager.hyprland = {
      enable = true;
      xwayland.enable = true;
      systemd.variables = ["--all"];
      settings = {
        "$mod" = "SUPER";
        "$terminal" = "kitty";
        monitor = 
          [ 
            "DP-1, preffered, 1920x0, 1"
            "HDMI-A-2, preffered, 0x0, 1"
          ];
        bindr = ["$mod, $mod_L, exec, rofi -show combi"];
        binde = 
          [
            ", XF86AudioRaiseVolume, exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%+"
            ", XF86AudioLowerVolume, exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"
            ", XF86AudioMute, exec, wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"
          ]; 
        bind =
          [
            "$mod, F, exec, firefox"
            "$mod, Q, exec, kitty"
            ", Print, exec, grimblast copy area"
          ]; 
      };
    };
}
