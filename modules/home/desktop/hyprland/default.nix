{ pkgs, ... }:

{
  imports = [
    ./hypridle
    ./hypr
    ./hyprlock
    ./rofi
    ./swaync
    ./waybar
  ];

  home.packages = with pkgs; [
    hyprshot
    hyprpicker
    hyprsunset
    hyprcursor
    swww
    wl-clipboard
    cliphist
    nautilus
  ];
}
