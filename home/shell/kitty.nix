{ config, ... }:

let
  palette = config.colorScheme.palette;
in

{
  programs.kitty = {
    enable = true;
    font = {
      name = "FiraMono Nerd Font Mono";
      size = 14;
    };
    settings = {
      tab_bar_edge = "top";
      tab_bar_style = "powerline";
      hide_window_decorations = "yes";
    };
    keybindings = {
      "ctrl+c" = "copy_or_interrupt";
      "ctrl+v" = "paste_from_clipboard";
    };
    extraConfig = ''
      foreground #${palette.base05}
      background #${palette.base00}
      color0  #${palette.base03}
      color1  #${palette.base08}
      color2  #${palette.base0B}
      color3  #${palette.base09}
      color4  #${palette.base0D}
      color5  #${palette.base0E}
      color6  #${palette.base0C}
      color7  #${palette.base06}
      color8  #${palette.base04}
      color9  #${palette.base08}
      color10 #${palette.base0B}
      color11 #${palette.base0A}
      color12 #${palette.base0C}
      color13 #${palette.base0E}
      color14 #${palette.base0C}
      color15 #${palette.base07}
      color16 #${palette.base00}
      color17 #${palette.base0F}
      color18 #${palette.base0B}
      color19 #${palette.base09}
      color20 #${palette.base0D}
      color21 #${palette.base0E}
      color22 #${palette.base0C}
      color23 #${palette.base06}
      cursor  #${palette.base07}
      cursor_text_color #${palette.base00}
      selection_foreground #${palette.base01}
      selection_background #${palette.base0D}
      url_color #${palette.base0C}
      active_border_color #${palette.base04}
      inactive_border_color #${palette.base00}
      bell_border_color #${palette.base03}
      active_tab_foreground   #${palette.base04}
      active_tab_background   #${palette.base00}
      active_tab_font_style   bold
      inactive_tab_foreground #${palette.base07}
      inactive_tab_background #${palette.base08}
      inactive_tab_font_style bold
      tab_bar_background #${palette.base00}
    '';
  };
}
