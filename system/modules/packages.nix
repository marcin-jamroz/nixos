{ pkgs, config, inputs, ... }:

{
  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # List System Programs
  environment.systemPackages = with pkgs; [
    wget
    curl 
    git
    neofetch
    polkit_gnome
    lm_sensors
    unzip
    unrar
    libnotify
    wl-clipboard
    brightnessctl
    swappy 
    networkmanagerapplet
    yad
    playerctl
    nh
    vim
  ];

  programs = {
    # steam.gamescopeSession.enable = true;
    hyprland = {
      enable = true;
      package = inputs.hyprland.packages.${pkgs.system}.hyprland;
      xwayland.enable = true;
    };
    fuse.userAllowOther = true;
    mtr.enable = true;
  };
}

