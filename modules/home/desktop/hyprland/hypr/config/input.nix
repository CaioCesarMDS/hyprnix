{ vars, ... }:

{
  wayland.windowManager.hyprland.settings = {
    cursor = {
      hide_on_key_press = true;
      inactive_timeout = 10;
      #no_hardware_cursors = true;
    };
    
    input = {
      kb_layout = vars.keyboardLayout;
      kb_variant = vars.keyboardVariant;
      follow_mouse = true;
    };
  };
}
