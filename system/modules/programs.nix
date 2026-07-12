{ pkgs, ... }:

{
  programs = {
    fuse.userAllowOther = true;
    mtr.enable = true;
    coolercontrol.enable = true;
    hyprland = {
      enable = true;
      withUWSM = true;
      package = pkgs.master.hyprland;
      portalPackage = pkgs.master.xdg-desktop-portal-hyprland;
    };
  };

  xdg.portal = {
    enable = true;
    extraPortals = [
      pkgs.master.xdg-desktop-portal-gtk
      pkgs.master.kdePackages.xdg-desktop-portal-kde
    ];
    configPackages = [ pkgs.master.hyprland ];
    config.hyprland = {
      default = [
        "hyprland"
        "gtk"
      ];
      "org.freedesktop.impl.portal.FileChooser" = "kde";
      "org.freedesktop.impl.portal.Print" = "kde";
    };
  };
}
