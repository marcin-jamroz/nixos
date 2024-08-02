{ config, pkgs, gtkThemeFromScheme, inputs, ... }:

{

  imports = [
    inputs.nix-colors.homeManagerModules.default
    inputs.hyprland.homeManagerModules.default
    ./shell
    ./desktop
    ./game
    ./packages.nix
  ];

  home.username = "marcin-jamroz";
  home.homeDirectory = "/home/marcin-jamroz";
  home.stateVersion = "23.11";
  home.sessionVariables = {
    EDITOR = "vim";
    BROWSER = "firefox";
    TERMINAL = "kitty";
  };

  # Set The Colorscheme
  colorScheme = inputs.nix-colors.colorSchemes.dracula;

  programs.git = {
    enable = true;
    extraConfig = {
      init = {
        defaultBranch = "master";
      };
    };
    userName = "marcin-jamroz";
    userEmail = "17850284+marcin-jamroz@users.noreply.github.com";
  };

  programs.home-manager.enable = true;
}
