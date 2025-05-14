{ ... }:

{

  imports = [
    ./shell
    ./desktop
    ./game
    ./code
    ./programs
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

  stylix.targets = {
    waybar.enable = false;
    hyprlock.enable = false;
    qt.enable = false;
  };

  programs.home-manager.enable = true;
}
