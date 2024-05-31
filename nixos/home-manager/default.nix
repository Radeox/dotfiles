{ ... }: {
  imports = [
    ./alacritty.nix
    ./git.nix
    ./hypridle.nix
    ./hyprland.nix
    ./hyprlock.nix
    ./kanshi.nix
    ./neovim.nix
    ./ranger.nix
    ./theme.nix
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
}
