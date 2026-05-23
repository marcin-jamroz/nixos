{
  config,
  lib,
  pkgs,
  ...
}:

let
  palette = config.lib.stylix.colors;
  pureColorStrings = lib.attrsets.filterAttrs (name: value: builtins.isString value) palette;
  luaPaletteLines = lib.attrsets.mapAttrsToList (
    name: value: " [\"${name}\"] = \"#${lib.strings.toLower value}\","
  ) pureColorStrings;
  luaPaletteString = builtins.concatStringsSep "\n" luaPaletteLines;
in
{
  # lua configuration
  xdg.configFile."hypr/hyprland.lua".enable = false;

  home.file.".config/hypr/hyprland.lua".source = ./hyprland.lua;
  home.file.".config/hypr/nix_vars.lua".text = ''
    local M = {}

    M.palette = {${luaPaletteString}}

    return M
  '';
  # lua

  xdg = {
    userDirs = {
      enable = true;
      createDirectories = true;
      setSessionVariables = false;
    };
    portal = {
      enable = true;
      extraPortals = with pkgs.master; [
        xdg-desktop-portal-hyprland
        xdg-desktop-portal-gtk
        kdePackages.xdg-desktop-portal-kde
      ];
      # xdgOpenUsePortal = true;
      configPackages = [ config.wayland.windowManager.hyprland.package ];
      config.hyprland = {
        default = [
          "hyprland"
          "gtk"
        ];
        "org.freedesktop.impl.portal.FileChooser" = "kde";
        "org.freedesktop.impl.portal.Print" = "kde";
      };
    };
  };

  wayland.windowManager.hyprland = {
    enable = true;
    xwayland.enable = true;
    systemd.variables = [ "--all" ];
    systemd.enable = false;
    package = pkgs.master.hyprland;
    configType = "lua";
    importantPrefixes = [ ];
    settings = {
      monitor = [
        {
          output = "DP-1";
          mode = "preferred";
          position = "1920x0";
          scale = "1";
        }
        {
          output = "HDMI-A-2";
          mode = "preffered";
          position = "0x0";
          scale = "1";
        }
      ];
      config = {
        decoration = {
          rounding = 10;
        };
      };
    };
  };
}
