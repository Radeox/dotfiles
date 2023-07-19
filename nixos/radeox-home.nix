{ pkgs, ... }: {
  # ZSH Configuration
  programs = {
    zsh = {
      enable = true;

      enableAutosuggestions = true;
      enableCompletion = true;
      defaultKeymap = "viins";

      shellAliases = {
        # NixOS commands
        nix-update = "sudo nixos-rebuild switch";

        # Aliases
        ".." = "cd .. && ls";
        f = "vifm";
        find = "fd";
        ll = "ls -l";
        p = "ps aux | grep ";
        pr = "poetry run python";
        rgrep = "rg";
        sl = "ls";
        sudo = "sudo ";
        tig = "lazygit";
        v = "vim";
        vim = "nvim";
        xbox-pair = "sudo systemctl kill -s SIGUSR1 xow";

        # Basic commands
        cat = "bat -p";
        df = "duf";
        du = "dust";
        ls = "lsd";

        # Scripts
        bt_manager = "bash ~/Sources/scripts/bluetooth_manager.sh";
        clean_system = "bash ~/Sources/scripts/clean_system.sh";
        myip = "bash ~/Sources/scripts/my_ip.sh";
        yee = "python ~/Sources/Projects/TermYeeLight/manager.py";
      };

      # Oh My ZSH Configuration
      oh-my-zsh = {
        enable = true;

        plugins = [
          "autojump"
          "docker"
          "docker-compose"
          "pip"
          "poetry"
          "python"
          "sudo"
          "vscode"
        ];
      };

      plugins = with pkgs; [{
        name = "zsh-syntax-highlighting";
        src = fetchFromGitHub {
          owner = "zsh-users";
          repo = "zsh-syntax-highlighting";
          rev = "0.7.1";
          sha256 = "0zmq66dzasmr5pwribyh4kbkk23jxbpdw4rjxx0i7dx8jjp2lzl4";
        };
        file = "zsh-syntax-highlighting.zsh";
      }

        ];

      history = {
        expireDuplicatesFirst = true;
        save = 10000;
        size = 10000;
      };
    };

    # Starship configuration
    starship = {
      enable = true;
      enableZshIntegration = true;
    };

    # Git Configuration
    git = {
      enable = true;
      userName = "Dawid Weglarz";
      userEmail = "dawid.weglarz95@gmail.com";
    };

  };

  # Home configuration
  home.username = "radeox";
  home.homeDirectory = "/home/radeox";
  home.stateVersion = "23.05";
  programs.home-manager.enable = true;
}
