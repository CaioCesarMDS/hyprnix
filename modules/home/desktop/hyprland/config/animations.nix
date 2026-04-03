{ ... }:

{
  wayland.windowManager.hyprland.settings = {
    animations = {
      enabled = true;
      
      bezier = [
        "smooth, 0.25, 0.1, 0.25, 1"
        "balanced, 0.2, 0, 0.3, 1"
        "crisp, 0.3, 0, 0.4, 1"
        "flow, 0.15, 0, 0.35, 1"
      ];

      animation = [
        "windows, 1, 4, smooth"
        "windowsIn, 1, 3, balanced, slide"
        "windowsOut, 1, 2, crisp, slide"
        "workspaces, 1, 4, flow, slide"
      ];
    };
  };
}
