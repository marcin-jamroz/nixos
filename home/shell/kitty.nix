{ ... }:

{
  programs.kitty = {
    enable = true;
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
      active_tab_font_style   bold
      inactive_tab_font_style bold
    '';
  };
}
