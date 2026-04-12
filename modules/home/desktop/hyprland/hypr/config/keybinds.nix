{ ... }:

{
  wayland.windowManager.hyprland.settings = {
    "$mainMod" = "SUPER";

    "$terminal" = "kitty";
    "$explorer" = "nautilus";
    "$browser" = "firefox";
    "$editor" = "code";

    bind = [
      # --- Applications ---
      "$mainMod, Q, exec, uwsm app -- $terminal"                       # Launch terminal
      "$mainMod, F, exec, uwsm app -- $browser"                        # Launch browser
      "$mainMod, D, exec, uwsm app -- $editor"                         # Launch editor
      "$mainMod, E, exec, uwsm app -- $explorer"                       # Launch file explorer
      "$mainMod, R, exec, rofi-launcher"                               # Open app launcher

      # --- System & Utilities ---
      "$mainMod, Delete, exit,"                                        # Exit Hyprland
      "$mainMod, L, exec, hyprlock"                                    # Lock screen
      "$mainMod, ESCAPE, exec, rofi-powermenu"                         # Power menu
      "$mainMod, A, exec, swaync-client -t -sw"                        # Toggle notifications

      # --- Wallpaper Management ---
      "$mainMod SHIFT, W, exec, rofi-wallpaper-manager --select"       # Select wallpaper
      "$mainMod SHIFT, A, exec, rofi-wallpaper-manager --prev"         # Previous wallpaper
      "$mainMod SHIFT, D, exec, rofi-wallpaper-manager --next"         # Next wallpaper

      # --- Clipboard Management ---
      "$mainMod, V, exec, rofi-clipboard-manager -c"                   # Clipboard pick
      "$mainMod SHIFT, V, exec, rofi-clipboard-manager"                # Clipboard manager

      # --- Window Management ---
      "$mainMod, C, killactive,"                                       # Close active window
      "$mainMod SHIFT, C, exec, hyprctl killwindow"                    # Force kill window
      "$mainMod, W, togglefloating,"                                   # Toggle floating mode
      "$mainMod, J, togglesplit,"                                      # Toggle split direction
      "$mainMod, P, pseudo,"                                           # Toggle pseudo-tiling
      "$mainMod, SPACE, fullscreen, 1"                                 # Fullscreen (keep bar)
      "$mainMod SHIFT, SPACE, fullscreen, 0"                           # Fullscreen (true)
      "$mainMod, bracketleft, splitratio, -0.05"                       # Decrease split ratio
      "$mainMod, bracketright, splitratio, +0.05"                      # Increase split ratio

      # --- Focus & Window Movement ---
      "$mainMod, Left, movefocus, l"                                   # Focus left
      "$mainMod, Right, movefocus, r"                                  # Focus right
      "$mainMod, Up, movefocus, u"                                     # Focus up
      "$mainMod, Down, movefocus, d"                                   # Focus down
      "$mainMod SHIFT, H, movewindow, l"                               # Move window left
      "$mainMod SHIFT, L, movewindow, r"                               # Move window right
      "$mainMod SHIFT, K, movewindow, u"                               # Move window up
      "$mainMod SHIFT, J, movewindow, d"                               # Move window down

      # --- Workspace Navigation ---
      "$mainMod Control, Right, workspace, r+1"                        # Next workspace
      "$mainMod Control, Left, workspace, r-1"                         # Previous workspace
      "$mainMod, mouse_down, workspace, e+1"                           # Scroll to next workspace
      "$mainMod, mouse_up, workspace, e-1"                             # Scroll to previous workspace
      "$mainMod, S, togglespecialworkspace,"                           # Toggle scratchpad
      "$mainMod Shift, S, movetoworkspace, special"                    # Move to scratchpad
      "$mainMod Alt, S, movetoworkspacesilent, special"                # Move to scratchpad (silent)

      # --- Screenshots (Hyprshot) ---
      "$mainMod, PRINT, exec, hyprshot -m window -f $(date +%Y-%m-%d_%H-%M-%S).png -o ~/Pictures/screenshots"       # Window screenshot
      "$mainMod SHIFT, PRINT, exec, hyprshot -m region -f $(date +%Y-%m-%d_%H-%M-%S).png -o ~/Pictures/screenshots" # Region screenshot
      "$mainMod Control, PRINT, exec, hyprshot -m output -f $(date +%Y-%m-%d_%H-%M-%S).png -o ~/Pictures/screenshots" # Monitor screenshot

      # --- Accessibility ---
      "$mainMod ALT, mouse_down, exec, hyprctl keyword cursor:zoom_factor \"$(hyprctl getoption cursor:zoom_factor | awk 'NR==1 {factor = $2; if (factor < 1) {factor = 1}; print factor * 2.0}')\"" # Zoom in
      "$mainMod ALT, mouse_up, exec, hyprctl keyword cursor:zoom_factor \"$(hyprctl getoption cursor:zoom_factor | awk 'NR==1 {factor = $2; if (factor < 1) {factor = 1}; print factor / 2.0}')\""   # Zoom out
    ]
    ++ (builtins.concatLists (
      builtins.genList (
        i:
        let
          ws = i + 1;
        in
        [
          "$mainMod, ${toString ws}, workspace, ${toString ws}"                    # Switch to workspace
          "$mainMod SHIFT, ${toString ws}, movetoworkspace, ${toString ws}"         # Move window to workspace
          "$mainMod ALT, ${toString ws}, movetoworkspacesilent, ${toString ws}"     # Move to workspace (silent)
        ]
      ) 9
    ));

    # --- Window Resizing (Repeatable) ---
    binde = [
      "$mainMod Shift, Right, resizeactive, 30 0"                      # Resize right
      "$mainMod Shift, Left, resizeactive, -30 0"                      # Resize left
      "$mainMod Shift, Up, resizeactive, 0 -30"                        # Resize up
      "$mainMod Shift, Down, resizeactive, 0 30"                       # Resize down
    ];

    # --- Media & Hardware Keys ---
    bindel = [
      # Volume
      ",XF86AudioRaiseVolume, exec, wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+"
      ",XF86AudioLowerVolume, exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"
      ",XF86AudioMute, exec, wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"

      # Media Player
      ",XF86AudioPlay, exec, playerctl play-pause"
      ",XF86AudioNext, exec, playerctl next"
      ",XF86AudioPrev, exec, playerctl previous"
      ",XF86AudioStop, exec, playerctl stop"

      # Brightness
      ",XF86MonBrightnessUp, exec, brightnessctl set +10%"
      ",XF86MonBrightnessDown, exec, brightnessctl set 10%-"
    ];

    # --- Mouse Bindings ---
    bindm = [
      "$mainMod, mouse:272, movewindow"                                # Drag to move
      "$mainMod, mouse:273, resizewindow"                              # Drag to resize
    ];
  };
}
