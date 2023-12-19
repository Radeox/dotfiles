{ ... }: {
  imports = [ ./home.nix.d/alacritty.nix ./home.nix.d/nvim.nix ];

  programs = {
    # Git Configuration
    git = {
      enable = true;
      userName = "Dawid Weglarz";
      userEmail = "dawid.weglarz95@gmail.com";
    };

    # Enable Home Manager
    home-manager.enable = true;
  };

  # Home configuration
  home = {
    username = "radeox";
    homeDirectory = "/home/radeox";
    stateVersion = "23.11";
  };
}
