{ ... }:

{
  wayland.windowManager.hyprland.settings = {
    # to list all monitor: "hyprctl monitors all" :
    # Format: <monitor-name>,<resolution>@<refresh-rate>,<position>,<scale>
    monitor = "eDP-1,1920x1080@60,auto,1";
  };
}
