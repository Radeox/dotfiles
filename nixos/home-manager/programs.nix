{ pkgs, ... }: {
  programs = {
    # Fish shell configuration
    fish = {
      enable = true;

      # Fish plugins
      plugins = [
        { name = "done"; src = pkgs.fishPlugins.done; }
        { name = "fzf-fish"; src = pkgs.fishPlugins.fzf-fish; }
        { name = "grc"; src = pkgs.fishPlugins.grc; }
      ];

      # Disable greeting
      interactiveShellInit = ''
        set fish_greeting
      '';
    };

    # Zoxide configuration
    zoxide = {
      enable = true;
      enableFishIntegration = true;
      options = [
        "--cmd cd"
      ];
    };

    # Eza configuration
    eza = {
      enable = true;
      enableFishIntegration = true;
      extraOptions = [
        "--group-directories-first"
        "--icons"
      ];
    };

    # Bat configuration
    bat = {
      enable = true;
      extraPackages = with pkgs.bat-extras; [
        batdiff
        batgrep
        batman
        batwatch
        prettybat
      ];
    };

    # Git configuration
    git = {
      enable = true;
      settings.user = {
        name = "Dawid Weglarz";
        email = "dawid.weglarz95@gmail.com";
      };
    };

    # Lazygit configuration
    lazygit = {
      enable = true;

      settings = {
        "notARepository" = "quit";
      };
    };

    # Ranger configuration
    ranger = {
      enable = true;

      extraConfig = ''
        set preview_images true
        map dd shell mv %s ~/.local/share/Trash/files/
      '';
    };
  };

  services = {
    # MegaSync configuration
    megasync.enable = true;
  };
}
