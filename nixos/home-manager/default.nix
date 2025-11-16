{ ... }:
{
  imports = [
    ./display-managers.nix
    ./ghostty.nix
    ./git.nix
    ./neovim.nix
    ./programs.nix
    ./shell.nix
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
