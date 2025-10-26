{ pkgs, ... }:

{
  stylix = {
    enable = true;
    image = ../custom/nixos-1.png;

    cursor = {
      package = pkgs.bibata-cursors;
      name = "Bibata-Modern-Ice";
      size = 28;
    };

    fonts = {
      serif = {
        package = pkgs.dejavu_fonts;
        name = "DejaVu Serif";
      };

      sansSerif = {
        package = pkgs.dejavu_fonts;
        name = "DejaVu Sans";
      };

      monospace = {
        package = pkgs.nerd-fonts.fira-mono;
        name = "FiraMono Nerd Font Mono";
      };

      emoji = {
        package = pkgs.noto-fonts-color-emoji;
        name = "Noto Color Emoji";
      };

      sizes = {
        applications = 12;
        terminal = 14;
        desktop = 11;
        popups = 16;
      };

    };

    base16Scheme = "${pkgs.base16-schemes}/share/themes/dracula.yaml";
    # polarity = "dark";
  };
}
