{ config, pkgs, ... }:

{
  gtk = {
    enable = true;

    gtk4.theme = config.gtk.theme;

    iconTheme = {
      name = "Papirus-Dark";
      package = pkgs.papirus-icon-theme;
    };

    theme = {
      name = "catppuccin-mocha-blue-standard";
      package = (
        pkgs.catppuccin-gtk.override {
          variant = "mocha";
          accents = [ "blue" ];
        }
      );
    };

    cursorTheme = {
      name = "Bibata-Modern-Classic";
      package = pkgs.bibata-cursors;
      size = 24;
    };
  };
}
