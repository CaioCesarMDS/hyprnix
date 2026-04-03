{ config, pkgs, ... }:

{
  programs.zsh = {
    enable = true;

    enableCompletion = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;

    dotDir = "${config.xdg.configHome}/zsh";

    history = {
      size = 10000;
      save = 10000;
      ignoreAllDups = true;
      ignoreDups = true;
      ignoreSpace = true;
      path = "${config.xdg.cacheHome}/zsh/history";
    };

    initContent = ''
      setopt share_history
      setopt correct

      zstyle ':fzf-tab:*' use-fzf-default-opts yes
      zstyle ':fzf-tab:complete:cd:*' fzf-preview 'eza -1 --icons --color=always $realpath'

      zstyle ':fzf-tab:complete:cd:*' fzf-preview 'eza -1 --icons --color=always $realpath'
    '';

    shellAliases = {
      c = "clear";
      h = "history";
      ff = "fastfetch";

      ls = "eza --color=always --icons=always --group-directories-first --no-filesize --no-time --no-user --no-permissions";
      ll = "eza -lh --color=always --icons --group-directories-first";
      la = "eza -a --color=always --group-directories-first --icons";
      lah = "eza -lah --color=always --group-directories-first --icons --git --time-style=long-iso";
      lt = "eza -aT --color=always --group-directories-first --icons --ignore-glob=node_modules --ignore-glob=.git --ignore-glob=venv";
    };

    plugins = [
      {
        name = "fzf-tab";
        src = pkgs.zsh-fzf-tab + "/share/fzf-tab";
      }
      {
        name = "you-should-use";
        src = pkgs.zsh-you-should-use + "/share/zsh/plugins/you-should-use";
      }
    ];
  };
}
