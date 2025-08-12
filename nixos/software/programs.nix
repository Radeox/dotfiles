{ ... }: {
  programs = {
    # Fish shell
    fish.enable = true;

    # Android development
    adb.enable = true;

    # Nix ld
    nix-ld.enable = true;

    # Other stuff
    gamemode.enable = true;
    dconf.enable = true;
  };
}
