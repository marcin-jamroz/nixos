{
  pkgs,
  config,
  username,
  host,
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
