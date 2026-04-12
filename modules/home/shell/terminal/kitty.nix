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

    settings = {
      background = "#2A2A2A";
      foreground = "#CCCCCC";
      selection_background = "#383838";
      selection_foreground = "#FFFFFF";

      cursor = "#8FB573";
      cursor_text_color = "#2A2A2A";

      color0 = "#1F1F1F";
      color1 = "#FF7A84";
      color2 = "#8FB573";
      color3 = "#D7BA7D";
      color4 = "#79B8FF";
      color5 = "#B392F0";
      color6 = "#89DDFF";
      color7 = "#CCCCCC";

      color8 = "#5A5A5A";
      color9 = "#FF7A84";
      color10 = "#8FB573";
      color11 = "#D7BA7D";
      color12 = "#79B8FF";
      color13 = "#B392F0";
      color14 = "#89DDFF";
      color15 = "#FFFFFF";

      active_tab_background = "#383838";
      active_tab_foreground = "#FFFFFF";
      inactive_tab_background = "#2A2A2A";
      inactive_tab_foreground = "#888888";

      window_border_width = 1;
      active_border_color = "#383838";
      inactive_border_color = "#2A2A2A";
    };
  };
}
