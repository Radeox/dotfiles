{ ... }: {
  imports = [
    ./git.nix
    ./gnome.nix
    ./kitty.nix
    ./neovim.nix
    ./ranger.nix
    ./theme.nix
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
