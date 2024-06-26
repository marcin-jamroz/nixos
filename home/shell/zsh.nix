{ config, lib, pkgs, ... }:

{
  programs.zsh = {
    enable = true;
    syntaxHighlighting.enable = true;
    autosuggestion.enable = true;
    historySubstringSearch.enable = true;
    initExtra = ''
      zstyle ":completion:*" menu select
      zstyle ":completion:*" matcher-list "" "m:{a-z0A-Z}={A-Za-z}" "r:|=*" "l:|=* r:|=*"
    '';
    initExtraFirst = ''
      HISTFILE=~/.histfile
      HISTSIZE=1000
      SAVEHIST=1000
      setopt autocd nomatch
      setopt HIST_IGNORE_DUPS
      unsetopt beep extendedglob notify
      autoload -Uz compinit
      compinit
    '';
    shellAliases = {
      ls = "ls --color=auto";
      ll = "ls -l";
      la = "ls -la";
    };
  };
}
