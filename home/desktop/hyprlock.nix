{ pkgs, config, inputs, ... }:

let
  palette = config.colorScheme.palette;
  hexToRgbString = inputs.nix-colors.lib.conversions.hexToRGBString;
in {
  programs.hyprlock = {
    enable = true;
    general = {
      hide_cursor = true;
    };
    
    backgrounds = [
      {
        monitor = "";
        path = "~/.config/hypr/hyprlock/nixos-1.png";
        color = ''rgb(${hexToRgbString ", " palette.base02})'';
      }
    ];
    
    input-fields = [
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
       
        size = {
          width = 200;
          height = 50;
        };
        position = {
          x = 0;
          y = -415;
        };
        halign = "center";
        valign = "center";
      }
    ];
    
    labels = [
      {
        monitor = "";
        text = ''Hi, <span foreground="##${palette.base08}" style="italic" weight="bold" font_size="large">$USER</span>'';
        text_align = "center";
        color = ''rgb(${hexToRgbString ", " palette.base06})'';

        position = {
          x = 0;
          y = -350;
        };
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
        position = {
          x = 0;
          y = 450;
        };
      } 
      {
        monitor = "";
        text = ''cmd[] echo "<span foreground='##${palette.base0C}'>$(date '+%A, %e %B %Y')</span>"'';
        color = ''rgb(${hexToRgbString ", " palette.base0C})'';
        font_size = 25;
      
        halign = "center";
        valign = "center";
        position = {
          x = 0;
          y = 350;
        };
      }
    ];
  };
}
