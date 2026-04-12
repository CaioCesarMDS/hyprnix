{ lib, vars, ... }:

let
  desktop = vars.desktop;
in
{
  imports = [
    ./xdg-portal.nix
  ]
  ++ lib.optionals (desktop == "hyprland") [
    ./hyprland.nix
  ]
  ++ lib.optionals (desktop == "gnome") [
    ./gnome.nix
  ];
}
