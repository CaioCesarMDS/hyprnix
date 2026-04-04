{ vars, ... }:

{
  imports = [
    ./${vars.gpu}.nix
    ./bluetooth.nix
    ./power.nix
  ];

  hardware = {
    enableRedistributableFirmware = true;
    graphics = {
      enable = true;
      enable32Bit = true;
    };
  };

  zramSwap.enable = true;
}
