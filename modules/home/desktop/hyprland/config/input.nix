{ vars, ... }:

{
  wayland.windowManager.hyprland.settings = {
    input = {
      kb_layout = vars.keyboardLayout;
      kb_variant = vars.keyboardVariant;
      follow_mouse = true;
    };
  };
}
