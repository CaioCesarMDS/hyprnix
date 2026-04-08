{
  lib,
  vars,
  ...
}:

{
  wayland.windowManager.hyprland.settings = {
    env = [
      # --- Wayland & Ozone ---
      "NIXOS_OZONE_WL,1"
      "ELECTRON_OZONE_PLATFORM_HINT,auto"
      "MOZ_ENABLE_WAYLAND,1"

      # --- Toolkits ---
      "SDL_VIDEODRIVER,wayland"
      "CLUTTER_BACKEND,wayland"
      "GDK_BACKEND,wayland,x11,*"

      # --- Qt ---
      "QT_QPA_PLATFORM,wayland;xcb"
      "QT_QPA_PLATFORMTHEME,qt5ct"
      "QT_AUTO_SCREEN_SCALE_FACTOR,1"
      "QT_WAYLAND_DISABLE_WINDOWDECORATION,1"

      # --- XDG ---
      "XDG_CURRENT_DESKTOP,Hyprland"
      "XDG_SESSION_TYPE,wayland"
      "XDG_SESSION_DESKTOP,Hyprland"

      # --- Cursor ---
      "HYPRCURSOR_THEME,Bibata-Modern-Classic"
      "HYPRCURSOR_SIZE,20"
      "XCURSOR_THEME,Bibata-Modern-Classic"
      "XCURSOR_SIZE,20"
    ]
    # NVIDIA-specific environment variables
    ++ lib.optionals (vars.gpu == "nvidia") [
      "GBM_BACKEND,nvidia-drm"
      "LIBVA_DRIVER_NAME,nvidia"
      "NVD_BACKEND,direct"
      "__GLX_VENDOR_LIBRARY_NAME,nvidia"
    ];
  };
}
