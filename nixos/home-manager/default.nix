{ ... }: {
  imports = [
    ./alacritty.nix
    ./git.nix
    ./gnome.nix
    ./megasync.nix
    ./neovim.nix
    ./ranger.nix
    ./vscodium.nix
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
