{ config, lib, pkgs, inputs, ...}: 

let
  theme = config.colorScheme.palette;
  split-workspaces = inputs.split-monitor-workspaces;
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
      plugins = [
        split-workspaces.packages.${pkgs.system}.split-monitor-workspaces
      ];
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
        #  "swayidle -w timeout 720 'swaylock -f' timeout 800 'hyprctl dispatch dpms off' resume 'hyprctl dispatch dpms on' before-sleep 'swaylock -f -c 000000'"
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
          "QT_QPA_PLATFORM, wayland;xcb"
          "QT_WAYLAND_DISABLE_WINDOWDECORATION, 1"
          "QT_AUTO_SCREEN_SCALE_FACTOR, 1"
          "MOZ_ENABLE_WAYLAND, 1"
        ];
        monitor = 
          [ 
            "DP-1, preffered, 1920x0, 1"
            "HDMI-A-2, preffered, 0x0, 1"
          ];
        workspace = [
          "1, monitor:DP-1"
          "2, monitor:DP-1"
          "3, monitor:DP-1"
          "4, monitor:DP-1"
          "5, monitor:DP-1"
          "6, monitor:DP-1"
          "7, monitor:DP-1"
          "8, monitor:DP-1"
          "9, monitor:DP-1"
          "10, monitor:DP-1"

          "11, monitor:HDMI-A-2"
          "12, monitor:HDMI-A-2"
          "13, monitor:HDMI-A-2"
          "14, monitor:HDMI-A-2"
          "15, monitor:HDMI-A-2"
          "16, monitor:HDMI-A-2"
          "17, monitor:HDMI-A-2"
          "18, monitor:HDMI-A-2"
          "19, monitor:HDMI-A-2"
          "20, monitor:HDMI-A-2" 
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
          new_status = "master";
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
            "$mod, L, exec, hyprlock"
            "$mod, S, exec, screenshot"
            "$modSHIFT, O, exec, hyprctl keyword monitor DP-1,preffered,2000x0,1"
            "$mod, O, exec, hyprctl keyword monitor DP-1,preffered,1920x0,1"
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
            "$mod, 1, split-workspace, 1"
            "$mod, 2, split-workspace, 2"
            "$mod, 3, split-workspace, 3"
            "$mod, 4, split-workspace, 4"
            "$mod, 5, split-workspace, 5"
            "$mod, 6, split-workspace, 6"
            "$mod, 7, split-workspace, 7"
            "$mod, 8, split-workspace, 8"
            "$mod, 9, split-workspace, 9"
            "$mod, 0, split-workspace, 10"
            "$modSHIFT, 1, split-movetoworkspace, 1"
            "$modSHIFT, 2, split-movetoworkspace, 2"
            "$modSHIFT, 3, split-movetoworkspace, 3"
            "$modSHIFT, 4, split-movetoworkspace, 4"
            "$modSHIFT, 5, split-movetoworkspace, 5"
            "$modSHIFT, 6, split-movetoworkspace, 6"
            "$modSHIFT, 7, split-movetoworkspace, 7"
            "$modSHIFT, 8, split-movetoworkspace, 8"
            "$modSHIFT, 9, split-movetoworkspace, 9"
            "$modSHIFT, 0, split-movetoworkspace, 10"
            "$modCONTROL, right, split-workspace, r+1"
            "$modCONTROL, left, split-workspace, r-1"
            "$modCONTROLshift, right, split-movetoworkspace, r+1"
            "$modCONTROLshift, left, split-movetoworkspace, r-1" 
            "$mod, mouse_down, split-workspace, r+1"
            "$mod, mouse_up, split-workspace, r-1"
          ]; 
      };
    };
}
