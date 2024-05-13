{ ... }: {
  imports = [
    ./alacritty.nix
    ./git.nix
    ./hypridle.nix
    ./hyprland.nix
    ./neovim.nix
    ./ranger.nix
    ./tofi.nix
    ./wlogout.nix
  ];

  # Enable Home Manager
  programs.home-manager.enable = true;

  # Home configuration
  home = {
    username = "radeox";
    homeDirectory = "/home/radeox";
    stateVersion = "24.05";
  };

  catppuccin = {
    enable = true;

    # Flavour
    flavour = "macchiato";
    accent = "lavender";
  };

  # GTK
  gtk.catppuccin = {
    enable = true;
    flavour = "macchiato";
    accent = "lavender";
  };
}
