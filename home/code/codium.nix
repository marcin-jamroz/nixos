{ pkgs, ... }:
let
  baseSettings = {
    "editor.fontSize" = 16;
    "terminal.integrated.fontFamily" = "FiraMono Nerd Font Mono";
    "terminal.integrated.fontSize" = 16;
    "editor.formatOnSave" = true;
    "window.menuBarVisibility" = "toggle";
    "explorer.confirmDelete" = false;
    "explorer.confirmDragAndDrop" = false;
    "editor.multiCursorModifier" = "ctrlCmd";
  };
in
{
  programs.vscodium = {
    enable = true;
    profiles = {
      default = {
        enableExtensionUpdateCheck = true;
        enableUpdateCheck = true;
        userSettings = { };
      };
      nix = {
        extensions = with pkgs.vscode-extensions; [
          sumneko.lua
          jnoortheen.nix-ide
        ];
        userSettings = baseSettings // {
          "nix.enableLanguageServer" = true;
          "nix.serverPath" = "nixd";
          "nix.serverSettings" = {
            "nil" = {
              "formatting" = {
                "command" = [
                  "nixfmt"
                ];
              };
            };
            "nixd" = {
              "formatting" = {
                "command" = [
                  "nixfmt"
                ];
              };
            };
          };
        };
      };
      deno = {
        extensions = with pkgs.vscode-extensions; [
          denoland.vscode-deno
        ];
        userSettings = baseSettings // {
          "[html]" = {
            "editor.defaultFormatter" = "esbenp.prettier-vscode";
          };
        };
      };
      go = {
        extensions = with pkgs.vscode-extensions; [
          golang.go

        ];
      };
      "rust+web" = {
        extensions = with pkgs.vscode-extensions; [
          esbenp.prettier-vscode
          rust-lang.rust-analyzer
          bradlc.vscode-tailwindcss

        ];
        userSettings = baseSettings // {
          "[html]" = {
            "editor.defaultFormatter" = "esbenp.prettier-vscode";
          };
        };
      };
    };
  };
}
