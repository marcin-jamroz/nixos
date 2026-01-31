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
}
