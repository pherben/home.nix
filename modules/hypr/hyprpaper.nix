{ pkgs, ... }:

{
  systemd.user.services.hyprpaper = {
    Unit.Description = "Hyprpaper wallpaper daemon";
    Service.ExecStart = "${pkgs.hyprpaper}/bin/hyprpaper";
    Install.WantedBy = [ "graphical.target" ];
  };
}
