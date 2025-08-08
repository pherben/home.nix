{ config, pkgs, ... }:

{
  home.username = "keiran";
  home.homeDirectory = "/home/keiran";
  home.stateVersion = "25.05";

  xdg = {
    cacheHome = "${config.home.homeDirectory}/.cache";
    dataHome = "${config.home.homeDirectory}/.local/share";
    stateHome = "${config.home.homeDirectory}/.local/state";
  };

  programs.home-manager.enable = true;
}
