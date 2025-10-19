{ pkgs, ... }:

{
  services.xserver = {
    enable = true;
  };

  services.libinput.enable = true;

  services.displayManager.sddm = {
    enable = true;
    autoNumlock = true;
    wayland.enable = true;
    package = pkgs.kdePackages.sddm;
    theme = "sddm-astronaut-theme";
    extraPackages = [ pkgs.sddm-astronaut ];
  };

  environment.systemPackages = [
    (pkgs.sddm-astronaut.override {
      embeddedTheme = "cyberpunk";
    })
  ];
}
