{ config, lib, ...}: 

let
  theme = config.colorScheme.palette;
in with lib; {
   xdg = {
     userDirs = {
       enable = true;
       createDirectories = true;
     };
   };

   wayland.windowManager.hyprland = {
      enable = true;
      xwayland.enable = true;
      systemd.variables = ["--all"];
      systemd.enable = true;
      settings = {
        "$mod" = "SUPER";
        "$terminal" = "kitty";
        exec-once = [
          "$POLKIT_BIN"
          "hyprpaper"
          "waybar"
          "swaync"
          "nm-applet"
          "blueman-applet"
          "swayidle -w timeout 720 'swaylock -f' timeout 800 'hyprctl dispatch dpms off' resume 'hyprctl dispatch dpms on' before-sleep 'swaylock -f -c 000000'"
        ];
        env = [
          "NIXOS_OZONE_WL, 1"
          "NIXPKGS_ALLOW_UNFREE, 1"
          "XDG_CURRENT_DESKTOP, Hyprland"
          "XDG_SESSION_TYPE, wayland"
          "XDG_SESSION_DESKTOP, Hyprland"
          "GDK_BACKEND, wayland"
          "CLUTTER_BACKEND, wayland"
          "SDL_VIDEODRIVER, x11"
          "QT_QPA_PLATFORM, wayland"
          "QT_WAYLAND_DISABLE_WINDOWDECORATION, 1"
          "QT_AUTO_SCREEN_SCALE_FACTOR, 1"
          "MOZ_ENABLE_WAYLAND, 1"
        ];
        monitor = 
          [ 
            "DP-1, preffered, 1920x0, 1"
            "HDMI-A-2, preffered, 0x0, 1"
          ];
        general = {
          gaps_in = 6;
          gaps_out = 8;
          border_size = 2;
          "col.active_border" = "rgba(${theme.base0C}ff) rgba(${theme.base0D}ff) rgba(${theme.base0B}ff) rgba(${theme.base0E}ff) 45deg";
          "col.inactive_border" = "rgba(${theme.base00}cc) rgba(${theme.base01}cc) 45deg";
          layout = "dwindle";
          resize_on_border = true;
        };
        input = {
          kb_layout =  "pl, us";
          kb_options = "grp:alt_shift_toggle";
          follow_mouse = 1;
          touchpad = {
            natural_scroll = false;
          };
          sensitivity = 0; # -1.0 - 1.0, 0 means no modification.
          accel_profile = "flat";
        };
        gestures = {
          workspace_swipe = true;
          workspace_swipe_fingers = 3;
        };
        misc = {
          disable_hyprland_logo = true;
          mouse_move_enables_dpms = true;
          key_press_enables_dpms = false;
        };
        animations = {
          enabled = "yes";
          bezier = [
            "wind, 0.05, 0.9, 0.1, 1.05"
            "winIn, 0.1, 1.1, 0.1, 1.1"
            "winOut, 0.3, -0.3, 0, 1"
            "liner, 1, 1, 1, 1"
          ];
          animation = [
            "windows, 1, 6, wind, slide"
            "windowsIn, 1, 6, winIn, slide"
            "windowsOut, 1, 5, winOut, slide"
            "windowsMove, 1, 5, wind, slide"
            "border, 1, 1, liner"
            "borderangle, 1, 30, liner, loop"
            "fade, 1, 10, default"
            "workspaces, 1, 5, wind"
          ];
        };
        decoration = {
          rounding = 10;
          drop_shadow = false;
          blur = {
            enabled = true;
            size = 5;
            passes = 3;
            new_optimizations = "on";
            ignore_opacity = "on";
          };
        };
        plugin = {
          hyprtrails = {
            color = "rgba(${theme.base0A}ff)";
          };
        };
        dwindle = {
          pseudotile = true;
          preserve_split = true;
        };
        master = {
          new_is_master = true;
        };
        bindr = ["$mod, $mod_L, exec, rofi-launcher"];
        binde = 
          [
            ", XF86AudioRaiseVolume, exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%+"
            ", XF86AudioLowerVolume, exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"
            ", XF86AudioMute, exec, wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"
          ];
        bindm =
          [
            "$mod, mouse:272, movewindow"
            "$mod, mouse:273, resizewindow"
          ]; 
        bind =
          [
            "$mod, F, fullscreen"
            "$mod, T, exec, kitty"
            "$mod, L, exec, swaylock"
            "$mod, S, exec, screenshot"
            "$modSHIFT, SPACE, movetoworkspace, special"
            "$mod, SPACE, togglespecialworkspace"
            "$mod, Q, killactive"
            "$mod, P, pseudo"
            "$modSHIFT, I, togglesplit"
            "$modSHIFT, F, togglefloating"
            "$modSHIFT, left, movewindow, l"
            "$modSHIFT, right, movewindow, r"
            "$modSHIFT, up, movewindow, u"
            "$modSHIFT, down, movewindow, d"
            "$modSHIFT, h, movewindow, l"
            "$modSHIFT, l, movewindow, r"
            "$modSHIFT, k, movewindow, u"
            "$modSHIFT, j, movewindow, d"
            "$mod, left, movefocus, l"
            "$mod, right, movefocus, r"
            "$mod, up, movefocus, u"
            "$mod, down, movefocus, d"
            "$mod, h, movefocus, l"
            "$mod, l, movefocus, r"
            "$mod, k, movefocus, u"
            "$mod, j, movefocus, d"
            "$mod, 1, workspace, 1"
            "$mod, 2, workspace, 2"
            "$mod, 3, workspace, 3"
            "$mod, 4, workspace, 4"
            "$mod, 5, workspace, 5"
            "$mod, 6, workspace, 6"
            "$mod, 7, workspace, 7"
            "$mod, 8, workspace, 8"
            "$mod, 9, workspace, 9"
            "$mod, 0, workspace, 10"
            "$modSHIFT, 1, movetoworkspace, 1"
            "$modSHIFT, 2, movetoworkspace, 2"
            "$modSHIFT, 3, movetoworkspace, 3"
            "$modSHIFT, 4, movetoworkspace, 4"
            "$modSHIFT, 5, movetoworkspace, 5"
            "$modSHIFT, 6, movetoworkspace, 6"
            "$modSHIFT, 7, movetoworkspace, 7"
            "$modSHIFT, 8, movetoworkspace, 8"
            "$modSHIFT, 9, movetoworkspace, 9"
            "$modSHIFT, 0, movetoworkspace, 10"
            "$modCONTROL, right, workspace, e+1"
            "$modCONTROL, left, workspace, e-1"
            "$mod, mouse_down, workspace, e+1"
            "$mod, mouse_up, workspace, e-1"
          ]; 
      };
    };
}
