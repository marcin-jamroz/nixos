{ config, inputs, ... }:

let
  palette = config.colorScheme.palette;
  hexToRgbString = inputs.nix-colors.lib.conversions.hexToRGBString;
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
          color = ''rgb(${hexToRgbString ", " palette.base02})'';
        }
      ];

      input-field = [
        {
          monitor = "";
          placeholder_text = ''<span foreground="##${palette.base03}" style="italic">Input Password...</span>'';
          inner_color = ''rgb(${hexToRgbString ", " palette.base05})'';
          font_color = ''rgb(${hexToRgbString ", " palette.base00})'';
          hide_input = false;
          fade_on_empty = false;
          capslock_color = ''rgb(${hexToRgbString ", " palette.base08})'';
          numlock_color = ''rgb(${hexToRgbString ", " palette.base08})'';
          outline_thickness = 3;
          outer_color = ''rgb(${hexToRgbString ", " palette.base0C})'';

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
          color = ''rgb(${hexToRgbString ", " palette.base06})'';

          position = "0, -350";
          halign = "center";
          valign = "center";
        }
        {
          monitor = "";
          text = "$TIME";
          color = ''rgb(${hexToRgbString ", " palette.base0B})'';
          font_size = 60;

          halign = "center";
          valign = "center";
          position = "0, 450";
        }
        {
          monitor = "";
          text = ''cmd[] echo "<span foreground='##${palette.base0C}'>$(date '+%A, %e %B %Y')</span>"'';
          color = ''rgb(${hexToRgbString ", " palette.base0C})'';
          font_size = 25;

          halign = "center";
          valign = "center";
          position = "0, 350";
        }
      ];
    };
  };
}
