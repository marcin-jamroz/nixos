{ config, ...}: {
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
  };
}
