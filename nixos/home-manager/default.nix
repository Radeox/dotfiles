{ ... }: {
  imports = [
    ./alacritty.nix
    ./git.nix
    ./gnome.nix
    ./lazygit.nix
    ./megasync.nix
    ./neovim.nix
    ./ranger.nix
    ./zed.nix
  ];

  # Enable Home Manager
  programs.home-manager.enable = true;

  # Home configuration
  home = {
    username = "radeox";
    homeDirectory = "/home/radeox";
    stateVersion = "25.05";
  };
}
