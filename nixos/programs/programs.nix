{ ... }: {
  programs = {
    # Fish shell
    fish.enable = true;

    # Android development
    adb.enable = true;

    # AppImage
    appimage.enable = true;
    appimage.binfmt = true;

    # Other stuff
    gamemode.enable = true;
    dconf.enable = true;
  };
}
