{ ... }:

{
  wayland.windowManager.hyprland.settings = {
    # to list all monitor: "hyprctl monitors all" :
    # Format: <monitor-name>,<resolution>@<refresh-rate>,<position>,<scale>
    monitor = [ ", 1920x1080@165, auto, 1" ];
  };
}
