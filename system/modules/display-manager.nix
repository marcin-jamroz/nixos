{ pkgs, config, ... }:

{
  services.xserver = {
    enable = true;
  };

  services.libinput.enable = true;

  services.displayManager.sddm = {
      enable = true;
      autoNumlock = true;
      wayland.enable = true;
      theme = "tokyo-night-sddm";
     # theme = "sugar-dark";
    };

  environment.systemPackages =
let
    sugar = pkgs.callPackage ../custom/display-manager/sddm-sugar-dark.nix {};
    tokyo-night = pkgs.libsForQt5.callPackage ../custom/display-manager/sddm-tokyo-night.nix {};
in [ 
    sugar.sddm-sugar-dark # Name: sugar-dark
    tokyo-night # Name: tokyo-night-sddm
    pkgs.libsForQt5.qt5.qtgraphicaleffects
  ];
}
