{ ... }:

{
  programs.fzf = {
    enable = true;
    enableZshIntegration = true;
    historyWidgetOptions = [
      "--style=full"
    ];
    fileWidgetOptions = [
      "--style=full"
      "--walker-skip .git,node_modules,target"
      "--preview 'bat -n --color=always {} || cat {}'"
      "--bind 'ctrl-/:change-preview-window(down|hidden|)'"
    ];
    defaultCommand = "fd --type f";
    defaultOptions = [
      "--height 40%"
      "--border"
      "--color=dark"
    ];
  };
}
