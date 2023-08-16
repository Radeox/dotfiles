{ pkgs, ... }: {
  # ZSH configuration
  programs.zsh = {
    enable = true;

    enableAutosuggestions = true;
    enableCompletion = true;
    defaultKeymap = "viins";

    shellAliases = {
      # NixOS commands
      nix-clean = "sudo nix-collect-garbage -d";
      nix-config = "cd /etc/nixos && vim configuration.nix";
      nix-update = "sudo nixos-rebuild switch --upgrade";

      # Aliases
      ".." = "cd .. && ls";
      d = "lazydocker";
      f = "vifm";
      find = "fd";
      g = "lazygit";
      ll = "ls -l";
      p = "ps aux | grep ";
      pr = "poetry run python";
      rgrep = "rg";
      sl = "ls";
      sudo = "sudo ";
      v = "vim";
      vim = "nvim";

      # Basic commands
      cat = "bat -p";
      df = "duf";
      du = "dust";
      ls = "lsd";

      # Scripts
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
    }];

    history = {
      expireDuplicatesFirst = true;
      save = 10000;
      size = 10000;
    };
  };

  # Starship configuration
  programs.starship = {
    enable = true;
    enableZshIntegration = true;
  };
}
