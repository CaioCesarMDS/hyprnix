{ pkgs, ... }:

{
  qt = {
    enable = true;
    platformTheme.name = "kvantum";
    style.name = "kvantum";
  };

  home.packages = with pkgs; [
    (catppuccin-kvantum.override {
      accent = "blue";
      variant = "mocha";
    })
  ];
}
