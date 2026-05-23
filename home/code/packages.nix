{
  pkgs,
  ...
}:

{
  home.packages = with pkgs; [
    vscodium-fhs
    nixd
    nil
    nixfmt
  ];

  # programs.vscodium = {
  #   enable = true;
  #   profiles = {
  #     default = {
  #       userSettings = {
  #         "editor.multiCursorModifier" = "alt";
  #       };
  #     };
  #     nix = {
  #       extensions = with pkgs.vscode-extensions; [
  #         sumneko.lua
  #         jnoortheen.nix-ide
  #       ];
  #     };
  #   };
  # };
}
