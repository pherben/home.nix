{ config, pkgs, ... }:

{
  imports = [
    ./modules/core.nix
    ./modules/env.nix
    ./modules/gtk-qt.nix
    ./modules/programs/fish.nix
    ./modules/programs/helix.nix
    ./modules/programs/git.nix
    ./modules/hypr/hyprland.nix
    ./modules/hypr/hyprpaper.nix
  ];
}
