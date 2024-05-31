{ pkgs, ... }: {
  # Catppuccin theme
  catppuccin = {
    enable = true;

    # Flavour
    flavor = "macchiato";
    accent = "lavender";
  };

  # Cattpuccin GTK
  gtk.catppuccin = {
    enable = true;

    flavor = "macchiato";
    accent = "lavender";
  };

  # Catppuccin cursor
  home.pointerCursor = {
    gtk.enable = true;
    name = "Catppuccin-Macchiato-Lavender-Cursors";
    package = pkgs.catppuccin-cursors.macchiatoLavender;
    size = 18;
  };
}
