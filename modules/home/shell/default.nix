{ pkgs, ... }:

{
  imports = [
    ./terminal/kitty.nix

    ./fzf.nix
    ./starship.nix
    ./yazi.nix
    ./zoxide.nix
    ./zsh.nix
  ];

  home.packages = with pkgs; [
    bat
    btop
    eza
    fd
    ripgrep
  ];
}
