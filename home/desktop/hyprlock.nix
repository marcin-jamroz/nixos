{ config, ... }:

let
  palette = config.lib.stylix.colors;
in
{
  programs.hyprlock = {
    enable = true;
    settings = {
      general = {
        hide_cursor = true;
      };

      background = [
        {
          monitor = "";
          path = "~/.config/hypr/hyprlock/nixos-1.png";
          color = ''rgb(${palette.base02})''; # rgb
        }
      ];

      input-field = [
        {
          monitor = "";
          placeholder_text = ''<span foreground="##${palette.base03}" style="italic">Input Password...</span>'';
          inner_color = ''rgb(${palette.base05})''; # rgb
          font_color = ''rgb(${palette.base00})''; # rgb
          hide_input = false;
          fade_on_empty = false;
          capslock_color = ''rgb(${palette.base08})''; # rgb
          numlock_color = ''rgb(${palette.base08})''; # rgb
          outline_thickness = 3;
          outer_color = ''rgb(${palette.base0C})''; # rgb

          size = "200, 50";
          position = "0, -415";
          halign = "center";
          valign = "center";
        }
      ];

      label = [
        {
          monitor = "";
          text = ''Hi, <span foreground="##${palette.base08}" style="italic" weight="bold" font_size="large">$USER</span>'';
          text_align = "center";
          color = ''rgb(${palette.base06})''; # rgb

          position = "0, -350";
          halign = "center";
          valign = "center";
        }
        {
          monitor = "";
          text = "$TIME";
          color = ''rgb(${palette.base0B})''; # rgb
          font_size = 60;

          halign = "center";
          valign = "center";
          position = "0, 450";
        }
        {
          monitor = "";
          text = ''cmd[] echo "<span foreground='##${palette.base0C}'>$(date '+%A, %e %B %Y')</span>"'';
          color = ''rgb(${palette.base0C})''; # rgb
          font_size = 25;

          halign = "center";
          valign = "center";
          position = "0, 350";
        }
      ];
    };
  };
}
