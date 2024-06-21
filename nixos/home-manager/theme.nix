{ pkgs, lib, ... }: {
  # Catppuccin theme
  catppuccin = {
    enable = true;
    flavor = "mocha";
    accent = "green";
  };

  # Cattpuccin GTK
  # gtk = {
  #   enable = true;
  #
  #   gtk3.extraConfig = {
  #     gtk-application-prefer-dark-theme = 1;
  #   };
  #
  #   gtk4.extraConfig = {
  #     gtk-application-prefer-dark-theme = 1;
  #   };
  #
  #   # Catppuccin cursor
  #   cursorTheme = {
  #     name = lib.mkForce "Catppuccin-Mocha-Green";
  #     package = lib.mkForce pkgs.catppuccin-cursors.mochaGreen;
  #   };
  # };
}
