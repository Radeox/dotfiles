{ pkgs, ... }: {
  # Catppuccin theme
  catppuccin = {
    enable = true;
    flavor = "mocha";
    accent = "green";
  };

  # gtk = {
  #   enable = true;
  #   theme = pkgs.orchis-theme;
  # };

  # programs.gnome-shell.theme = pkgs.orchis-theme;
}
