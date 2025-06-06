{ ... }: {
  services = {
    # Enable Gnome
    desktopManager.gnome.enable = true;

    # Enable GDM
    displayManager = {
      gdm = {
        enable = true;
        wayland = true;
      };
    };
  };
}
