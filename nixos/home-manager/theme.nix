{ pkgs, ... }: {
  # Catppuccin theme
  catppuccin = {
    enable = true;

    # Flavour
    flavor = "mocha";
    accent = "green";
  };

  # Cattpuccin GTK
  gtk.catppuccin = {
    enable = true;

    flavor = "mocha";
    accent = "green";
  };

  # Catppuccin cursor
  home.pointerCursor = {
    gtk.enable = true;
    name = "Catppuccin-Mocha-Green-Cursors";
    package = pkgs.catppuccin-cursors.mochaGreen;
    size = 22;
  };
}
