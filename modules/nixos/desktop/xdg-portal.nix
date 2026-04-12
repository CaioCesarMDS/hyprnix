{ lib, pkgs, vars, ... }:

let
  desktop = vars.desktop;
in
{
  xdg.portal =
    {
      enable = true;
    }
    // lib.mkIf (desktop == "hyprland") {
      extraPortals = with pkgs; [
        xdg-desktop-portal-hyprland
        xdg-desktop-portal-gtk
      ];

      config = {
        common.default = [ "gtk" ];

        hyprland = {
          default = [ "hyprland" "gtk" ];

          "org.freedesktop.impl.portal.FileChooser" = [ "gtk" ];
          "org.freedesktop.impl.portal.Settings"    = [ "gtk" ];
          "org.freedesktop.impl.portal.OpenURI"     = [ "gtk" ];
        };
      };
    };
}
