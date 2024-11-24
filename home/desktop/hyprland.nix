{
  config,
  lib,
  ...
}:

let
  palette = config.lib.stylix.colors;
in

{
  xdg = {
    userDirs = {
      enable = true;
      createDirectories = true;
    };
  };

  wayland.windowManager.hyprland = {
    enable = true;
    xwayland.enable = true;
    systemd.variables = [ "--all" ];
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
      ];
      env = [
        "NIXOS_OZONE_WL, 1"
        "NIXPKGS_ALLOW_UNFREE, 1"
        "GDK_BACKEND, wayland"
        "CLUTTER_BACKEND, wayland"
        "SDL_VIDEODRIVER, x11"
        "XDG_CURRENT_DESKTOP, Hyprland"
        "XDG_SESSION_TYPE, wayland"
        "XDG_SESSION_DESKTOP, Hyprland"
        "QT_QPA_PLATFORM, wayland;xcb"
        "QT_WAYLAND_DISABLE_WINDOWDECORATION, 1"
        "QT_AUTO_SCREEN_SCALE_FACTOR, 1"
        "MOZ_ENABLE_WAYLAND, 1"
      ];
      monitor = [
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
        "col.active_border" = lib.mkForce "rgb(${palette.base0C}) rgb(${palette.base0D}) rgb(${palette.base0B}) rgb(${palette.base0E}) 45deg";
        "col.inactive_border" = lib.mkForce "rgb(${palette.base00}) rgb(${palette.base01}) 45deg";
        layout = "dwindle";
        resize_on_border = true;
      };
      input = {
        kb_layout = "pl, us";
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
        blur = {
          enabled = true;
          size = 5;
          passes = 3;
          new_optimizations = "on";
          ignore_opacity = "on";
        };
      };
      dwindle = {
        pseudotile = true;
        preserve_split = true;
      };
      master = {
        new_status = "master";
      };
      bindr = [ "$mod, $mod_L, exec, rofi-launcher" ];
      binde = [
        ", XF86AudioRaiseVolume, exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%+"
        ", XF86AudioLowerVolume, exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"
        ", XF86AudioMute, exec, wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"
      ];
      bindm = [
        "$mod, mouse:272, movewindow"
        "$mod, mouse:273, resizewindow"
      ];
      bind = [
        "$mod, F, fullscreen"
        "$mod, T, exec, kitty"
        "$mod, L, exec, loginctl lock-session"
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
        "$mod, 1, workspace, r~1"
        "$mod, 2, workspace, r~2"
        "$mod, 3, workspace, r~3"
        "$mod, 4, workspace, r~4"
        "$mod, 5, workspace, r~5"
        "$mod, 6, workspace, r~6"
        "$mod, 7, workspace, r~7"
        "$mod, 8, workspace, r~8"
        "$mod, 9, workspace, r~9"
        "$mod, 0, workspace, r~10"
        "$modSHIFT, 1, movetoworkspace, r~1"
        "$modSHIFT, 2, movetoworkspace, r~2"
        "$modSHIFT, 3, movetoworkspace, r~3"
        "$modSHIFT, 4, movetoworkspace, r~4"
        "$modSHIFT, 5, movetoworkspace, r~5"
        "$modSHIFT, 6, movetoworkspace, r~6"
        "$modSHIFT, 7, movetoworkspace, r~7"
        "$modSHIFT, 8, movetoworkspace, r~8"
        "$modSHIFT, 9, movetoworkspace, r~9"
        "$modSHIFT, 0, movetoworkspace, r~10"
        "$modCONTROL, right, workspace, r+1"
        "$modCONTROL, left, workspace, r-1"
        "$modCONTROLshift, right, movetoworkspace, r+1"
        "$modCONTROLshift, left, movetoworkspace, r-1"
        "$mod, mouse_down, workspace, r+1"
        "$mod, mouse_up, workspace, r-1"
      ];
    };
  };
}
