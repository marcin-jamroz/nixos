{ pkgs, ... }:

{
  services.ollama = {
    enable = true;
    package = pkgs.master.ollama;
    acceleration = "rocm";
    rocmOverrideGfx = "11.0.1";
    # loadModels = [ "deepseek-r1:32b" ];
  };
}
