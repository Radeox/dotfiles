{ ... }: {
  programs = {
    # Configure Steam
    steam = {
      enable = true;
      gamescopeSession.enable = true;
    };

    # Enable Fish
    fish.enable = true;

    # Enable Gamemode
    gamemode.enable = true;

    # Enable GTK themes in Wayland
    dconf.enable = true;
  };
}
