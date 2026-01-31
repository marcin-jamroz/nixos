{ pkgs, ... }:

{
  services.ollama = {
    enable = true;
    package = pkgs.master.ollama-rocm;
    environmentVariables = {
      OLLAMA_FLASH_ATTENTION = "1";
      OLLAMA_NUM_PARALLEL = "1";
      OLLAMA_ORIGINS="moz-extension://*, http://localhost:*, http://127.0.0.1:*";
    };
    # rocmOverrideGfx = "11.0.1";
    # loadModels = [ "deepseek-r1:32b" ];
  };
}
