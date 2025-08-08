{ config, pkgs, ... }:

{
  wayland.windowManager.hyprland = {
    enable = true;
    settings = {
      "$mainMod" = "SUPER";
      "$terminal" = "ghostty";
      "$fileManager" = "yazi";
      "$browser" = "firefox";
      "$menu" = "wofi --show drun";

      env = [
        "HYPRCURSOR_THEME,Catppuccin-Mocha-Lavender"
        "HYPRCURSOR_SIZE,24"
        "QT_QPA_PLATFORMTHEME,qt6ct"
      ];

      exec = [
        "gsettings set org.gnome.desktop.interface color-scheme 'prefer-dark'"
      ];

      exec-once = [
        "waybar -s ${config.home.homeDirectory}/.config/waybar/styles.css -c ${config.home.homeDirectory}/.config/waybar/config.json"
        "hyprpaper"
        "mako"
        "caffeine"
        "wl-paste --type text --watch cliphist store"
        "wl-paste --type image --watch cliphist store"
      ];

      monitor = [
        ", preferred, auto, auto"
      ];

      input = {
        kb_layout = "gb";
        follow_mouse = 1;
        sensitivity = 0;
        touchpad.natural_scroll = false;
      };

      general = {
        gaps_in = 5;
        gaps_out = 20;
        border_size = 2;
        "col.active_border" = "rgba(b4befeff) rgba(89b4faff) 45deg";
        "col.inactive_border" = "rgba(313244ff)";
        resize_on_border = false;
        allow_tearing = true;
        layout = "dwindle";
      };

      ecosystem.no_update_news = true;

      decoration = {
        rounding = 12;
        rounding_power = 2;
        active_opacity = 0.98;
        inactive_opacity = 0.85;
        blur = {
          enabled = true;
          size = 4;
          passes = 2;
          vibrancy = 0.15;
        };
      };

      dwindle = {
        pseudotile = true;
        preserve_split = true;
      };

      master.new_status = "master";

      windowrule = [
        "suppressevent maximize, class:.*"
        "nofocus,class:^$,title:^$,xwayland:1,floating:1,fullscreen:0,pinned:0"
      ];

      bind = [
        "$mainMod, T, exec, $terminal"
        "$mainMod, R, exec, $menu"
        "$mainMod, B, exec, $browser"
        "$mainMod, E, exec, $fileManager"
        "$mainMod, H, togglefloating,"
        "$mainMod, Q, killactive,"
        "$mainMod, Delete, exit,"
        "$mainMod, V, exec, cliphist list | wofi --dmenu | cliphist decode | wl-copy"
        "$mainMod, P, exec, hyprpicker"
        ", Print, exec, $HOME/.local/bin/hyprshare -m window"
        ", Insert, exec, $HOME/.local/bin/hyprshare -m region"
        "$mainMod, Print, exec, $HOME/.local/bin/hyprshare -m output"
        "$mainMod, left, movefocus, l"
        "$mainMod, right, movefocus, r"
        "$mainMod, up, movefocus, u"
        "$mainMod, down, movefocus, d"
        "$mainMod, 1, workspace, 1"
        "$mainMod, 2, workspace, 2"
        "$mainMod, 3, workspace, 3"
        "$mainMod, 4, workspace, 4"
        "$mainMod, 5, workspace, 5"
        "$mainMod, 6, workspace, 6"
        "$mainMod, 7, workspace, 7"
        "$mainMod, 8, workspace, 8"
        "$mainMod, 9, workspace, 9"
        "$mainMod, 0, workspace, 10"
        "$mainMod SHIFT, 1, movetoworkspace, 1"
        "$mainMod SHIFT, 2, movetoworkspace, 2"
        "$mainMod SHIFT, 3, movetoworkspace, 3"
        "$mainMod SHIFT, 4, movetoworkspace, 4"
        "$mainMod SHIFT, 5, movetoworkspace, 5"
        "$mainMod SHIFT, 6, movetoworkspace, 6"
        "$mainMod SHIFT, 7, movetoworkspace, 7"
        "$mainMod SHIFT, 8, movetoworkspace, 8"
        "$mainMod SHIFT, 9, movetoworkspace, 9"
        "$mainMod SHIFT, 0, movetoworkspace, 10"
        "$mainMod, S, togglespecialworkspace, magic"
        "$mainMod SHIFT, S, movetoworkspace, special:magic"
        "$mainMod, mouse_down, workspace, e+1"
        "$mainMod, mouse_up, workspace, e-1"
      ];

      bindm = [
        "$mainMod, mouse:272, movewindow"
        "$mainMod, mouse:273, resizewindow"
      ];

      bindel = [
        ", XF86AudioRaiseVolume, exec, wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+"
        ", XF86AudioLowerVolume, exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"
        ", XF86AudioMute, exec, wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"
        ", XF86AudioMicMute, exec, wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"
        ", XF86MonBrightnessUp, exec, brightnessctl -e4 -n2 set 5%+"
        ", XF86MonBrightnessDown, exec, brightnessctl -e4 -n2 set 5%-"
      ];

      bindl = [
        ", XF86AudioNext, exec, playerctl next"
        ", XF86AudioPause, exec, playerctl play-pause"
        ", XF86AudioPlay, exec, playerctl play-pause"
        ", XF86AudioPrev, exec, playerctl previous"
      ];
    };
  };
}
