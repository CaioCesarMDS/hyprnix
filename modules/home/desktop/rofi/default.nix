{ ... }:

{
  imports = [
    ./clipboard
    ./launcher
    ./powermenu
    ./wallpaper
  ];

  programs.rofi = {
    enable = true;
  };
}
