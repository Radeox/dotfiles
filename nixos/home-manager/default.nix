{ ... }: {
  imports = [
    ./alacritty.nix
    ./git.nix
    ./hypridle.nix
    ./hyprland.nix
    ./kanshi.nix
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
    stateVersion = "24.11";
  };

  catppuccin = {
    enable = true;

    # Flavour
    flavor = "macchiato";
    accent = "lavender";
  };

  # Cattpuccin GTK
  gtk.catppuccin = {
    enable = true;

    flavor = "macchiato";
    accent = "lavender";
  };
}
