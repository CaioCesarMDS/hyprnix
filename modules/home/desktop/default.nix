{ pkgs, ... }:

{
  imports = [
    ./hypridle
    ./hyprland
    ./hyprlock
    ./rofi
    ./swaync
    ./theme
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
