{ ... }:

{
  programs.rofi = {
    enable = true;
    extraConfig = {
      modes = "window,drun,run,combi";
      combi-modes = "window,drun,run";
    };

  };
}
