{
  pkgs,
  ...
}:

{
  services.xserver.enable = true;
  services.xserver.videoDrivers = [ "amdgpu" ];

  environment.systemPackages = with pkgs; [ lact ];
  systemd.packages = with pkgs; [ lact ];
  systemd.services.lactd.wantedBy = [ "multi-user.target" ];
  boot.kernelParams = [ "amdgpu.ppfeaturemask=0xfffd7fff" ];
}
