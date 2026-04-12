{ pkgs, ... }:

{
  imports = [
    ./terminal/ghostty.nix

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
