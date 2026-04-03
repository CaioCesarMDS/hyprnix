{ pkgs, ... }:

{
  home.packages = with pkgs; [
    firefox
    vscode
    discord
    spotify
    qbittorrent

    claude-code
  ];
}
