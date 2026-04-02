{ pkgs, vars, ... }:

let
  custom-sddm-astronaut = pkgs.sddm-astronaut.override {
    embeddedTheme = vars.sddmTheme;
  };
in
{
  services.displayManager.sddm = {
    enable = true;
    wayland.enable = true;
    package = pkgs.kdePackages.sddm;
    theme = "sddm-astronaut-theme";

    extraPackages = with pkgs; [
      custom-sddm-astronaut
      kdePackages.qtsvg
      kdePackages.qtvirtualkeyboard
      kdePackages.qtmultimedia
    ];
  };

  environment.systemPackages = with pkgs; [
    custom-sddm-astronaut
  ];
}
