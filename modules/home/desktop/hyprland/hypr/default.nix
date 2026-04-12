{ ... }:

{
  imports = [ ./config ];

  wayland.windowManager.hyprland = {
    enable = true;
    systemd.enable = false;
  };
}
