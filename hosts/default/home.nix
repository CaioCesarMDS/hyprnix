{ vars, ... }:

{
  imports = [
    ../../modules/home/core
    ../../modules/home/desktop
    ../../modules/home/programs
    ../../modules/home/shell
  ];

  programs.home-manager.enable = true;

  home = {
    username = vars.username;
    homeDirectory = "/home/${vars.username}";
    stateVersion = "25.11";
  };
}
