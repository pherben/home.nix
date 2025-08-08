{ config, pkgs, ... }:

{
  home.sessionVariables = {
    NIXOS_OZONE_WL = "1";
    EDITOR = "hx";
    
    XDG_CONFIG_HOME = "${config.home.homeDirectory}/.config";
    XDG_CONFIG_DIR = "${config.home.homeDirectory}/.config";
    XDG_DATA_HOME = "${config.home.homeDirectory}/.local/share";
    XDG_DATA_DIRS = "${config.home.homeDirectory}/.local/share:/usr/local/share:/usr/share";
    XDG_STATE_HOME = "${config.home.homeDirectory}/.local/state";
    XDG_CACHE_HOME = "${config.home.homeDirectory}/.cache";
    XDG_DESKTOP_DIR = "${config.home.homeDirectory}/Desktop";
    XDG_DOWNLOAD_DIR = "${config.home.homeDirectory}/Downloads";
    XDG_TEMPLATES_DIR = "${config.home.homeDirectory}/Templates";
    XDG_PUBLICSHARE_DIR = "${config.home.homeDirectory}/Public";
    XDG_DOCUMENTS_DIR = "${config.home.homeDirectory}/Documents";
    XDG_MUSIC_DIR = "${config.home.homeDirectory}/Music";
    XDG_PICTURES_DIR = "${config.home.homeDirectory}/Pictures";
    XDG_VIDEOS_DIR = "${config.home.homeDirectory}/Videos";

    LESSHISTFILE = "/tmp/less-hist";
    PARALLEL_HOME = "${config.home.homeDirectory}/.config/parallel";

    GTK_THEME = "Adwaita:dark";
    QT_QPA_PLATFORMTHEME = "gtk2";
    QT_STYLE_OVERRIDE = "Adwaita-Dark";

    GOPATH = "${config.home.homeDirectory}/.local/share/go";
  };
}
