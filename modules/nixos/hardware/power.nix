{ ... }:

{
  services.auto-cpufreq = {
    enable = true;
    settings = {
      charger = {
        governor = "performance";
        turbo = "auto";
      };
    };
  };

  services.power-profiles-daemon.enable = false;
}
