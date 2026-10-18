{ ... }:

{
  programs.rofi = {
    enable = true;
    settings = {
      modes = "window,drun,run,combi";
      combi-modes = "window,drun,run";
    };

  };
}
