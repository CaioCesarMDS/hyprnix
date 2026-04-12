{ lib, vars, ... }:

let
  desktop = vars.desktop;
in
{
  imports = [
    ./theme
  ]
  ++ lib.optionals (desktop == "hyprland") [
    ./hyprland
  ];
  # ++ lib.optionals (desktop == "gnome") [
  #   ./gnome
  # ];
}
