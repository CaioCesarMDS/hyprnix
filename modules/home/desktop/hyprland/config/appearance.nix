{ ... }:

{
  wayland.windowManager.hyprland.settings = {
    general = {
      gaps_in = 3;
      gaps_out = 10;
      border_size = 0;
      layout = "dwindle";
    };

    decoration = {
      rounding = 10;
      active_opacity = 1.0;
      inactive_opacity = 0.8;

      shadow = {
        enabled = false;
      };

      blur = {
        enabled = true;
        size = 6;
        passes = 2;
        xray = true;
      };
    };

    misc = {
      force_default_wallpaper = 0;
      disable_hyprland_logo = true;
      vfr = true;
    };
  };
}
