{ pkgs, ... }:

{
  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # List System Programs
  environment.systemPackages = with pkgs; [
    wget
    curl
    git
    fastfetch
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
    feh
    usbutils
    s-tui
    stress
  ];
}
