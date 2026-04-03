{ ... }:

{
  programs.kitty = {
    enable = true;
    enableGitIntegration = true;

    shellIntegration = {
      enableZshIntegration = true;
    };

    font = {
      size = 12.0;
      name = "JetBrainsMono Nerd Font";
    };

    themeFile = "Catppuccin-Mocha";
  };
}
