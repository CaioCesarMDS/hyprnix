{ lib, vars, ... }:

let
  desktop = vars.desktop;
in
{
  imports = [
    ./dbus.nix
    ./flatpak.nix
    ./gvfs.nix
    ./ollama.nix
    ./pipewire.nix
    ./time.nix
  ]
  ++ lib.optionals (desktop == "hyprland") [
    ./sddm.nix
  ]
  ++ lib.optionals (desktop == "gnome") [
    ./gdm.nix
  ];
}
