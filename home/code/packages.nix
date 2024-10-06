{
  pkgs,
  ...
}:

{
  home.packages = with pkgs; [
    vscodium-fhs
    nixfmt-rfc-style
    nixd
    nil
  ];
}
