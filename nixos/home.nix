{ pkgs, ... }: {
  imports = [
    ./home.nix.d/alacritty.nix
    ./home.nix.d/gtk.nix
    ./home.nix.d/qt.nix
    ./home.nix.d/xdg.nix
    ./home.nix.d/zsh.nix
  ];

  programs = {
    # Git Configuration
    git = {
      enable = true;
      userName = "Dawid Weglarz";
      userEmail = "dawid.weglarz95@gmail.com";
    };
  };

  # Home configuration
  home = {
    username = "radeox";
    homeDirectory = "/home/radeox";
    stateVersion = "23.05";
  };
}
