{ ... }:
{
  programs.starship = {
    enable = true;
    # custom settings
    settings = {
      add_newline = false;
      aws.disabled = true;
      gcloud.disabled = true;
      line_break.disabled = true;
      character.success_symbol = "[➜](bold green)";
      character.error_symbol = "[➜](bold red)";
      directory.truncation_length = 5;
      directory.truncation_symbol = ".../";
    };
  };
}
