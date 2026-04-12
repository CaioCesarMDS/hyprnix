{ ... }:

{
  programs.ghostty = {
    enable = true;
    enableZshIntegration = true;
    settings = {
      font = {
        size = 12.0;
        name = "JetBrainsMono Nerd Font";
      };
    }
  };
}
