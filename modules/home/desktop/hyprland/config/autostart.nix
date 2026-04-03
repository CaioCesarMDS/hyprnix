{ pkgs, ... }:

{
  # --- systemd services ---
  systemd.user.services = {
    hyprpolkitagent = {
      Unit = {
        Description = "Hyprland Polkit Agent";
        PartOf = [ "graphical-session.target" ];
        After = [ "graphical-session.target" ];
      };
      Service = {
        ExecStart = "${pkgs.hyprpolkitagent}/bin/hyprpolkitagent";
        Restart = "on-failure";
      };
      Install = {
        WantedBy = [ "graphical-session.target" ];
      };
    };

    swww-daemon = {
      Unit = {
        Description = "swww daemon";
        PartOf = [ "graphical-session.target" ];
        After = [ "graphical-session-pre.target" ];
      };
      Service = {
        Type = "simple";
        ExecStart = "${pkgs.swww}/bin/swww-daemon";
        Restart = "on-failure";
        RestartSec = 1;
      };
      Install = {
        WantedBy = [ "graphical-session.target" ];
      };
    };

    cliphist = {
      Unit = {
        Description = "Clipboard manager (cliphist)";
        PartOf = [ "graphical-session.target" ];
        After = [ "graphical-session.target" ];
      };

      Service = {
        ExecStart = "${pkgs.wl-clipboard}/bin/wl-paste --watch ${pkgs.cliphist}/bin/cliphist store";
        Restart = "on-failure";
      };

      Install = {
        WantedBy = [ "graphical-session.target" ];
      };
    };

    hyprsunset = {
      Unit = {
        Description = "Hyprsunset";
        PartOf = [ "graphical-session.target" ];
        After = [ "graphical-session.target" ];
      };

      Service = {
        ExecStart = "${pkgs.hyprsunset}/bin/hyprsunset -t 4800";
        Restart = "on-failure";
      };

      Install = {
        WantedBy = [ "graphical-session.target" ];
      };
    };
  };

  # --- Hyprland exec-once ---
  wayland.windowManager.hyprland.settings = {
    "exec-once" = [
      "hyprctl setcursor Bibata-Modern-Classic 20"
      "waybar"
      "swaync"
    ];
  };
}
