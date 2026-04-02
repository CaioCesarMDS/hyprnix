{ pkgs, vars, ... }:

{
  users = {
    defaultUserShell = pkgs.zsh;

    users.${vars.username} = {
      isNormalUser = true;
      extraGroups = [
        "wheel"
        "networkmanager"
        "docker"
        "libvirtd"
      ];
    };
  };

}
