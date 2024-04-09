{ config, pkgs, ... }:

{

  imports = [
    ./shell
    ./desktop
  ];

  home.username = "marcin-jamroz";
  home.homeDirectory = "/home/marcin-jamroz";
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


  # This value determines the home Manager release that your
  # configuration is compatible with. This helps avoid breakage
  # when a new home Manager release introduces backwards
  # incompatible changes.
  #
  # You can update home Manager without changing this value. See
  # the home Manager release notes for a list of state version
  # changes in each release.
  home.stateVersion = "23.11";

  # Let home Manager install and manage itself.
  programs.home-manager.enable = true;
}
