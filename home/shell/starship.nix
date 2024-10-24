{ config, lib, ... }:
{
  programs.starship = {
    enable = true;
    settings = {
      add_newline = false;
      aws.disabled = true;
      gcloud.disabled = true;
      line_break.disabled = false;
      character.success_symbol = lib.mkForce "[➜](bold #${config.lib.stylix.colors.base0B})";
      character.error_symbol = lib.mkForce "[➜](bold #${config.lib.stylix.colors.base08})";
      directory.truncation_length = 5;
      directory.truncation_symbol = ".../";
    };
  };
}
