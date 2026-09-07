{ pkgs, ... }:
{
  stylix = {
    enable = true;

    # Explicitly set dark mode
    polarity = "dark";

    # Apply everforest-dark-hard theme
    base16Scheme = "${pkgs.base16-schemes}/share/themes/gruvbox-material-dark-medium.yaml";

    # Enable GTK support
    targets.gtk.enable = true;

    # Enable Flatpak support for GTK applications
    targets.gtk.flatpakSupport.enable = false;

    fonts = {
      serif = {
        package = pkgs.noto-fonts;
        name = "Noto Serif";
      };

      sansSerif = {
        package = pkgs.noto-fonts;
        name = "Noto Sans";
      };

      monospace = {
        package = pkgs.nerd-fonts.jetbrains-mono;
        name = "JetBrainsMono Nerd Font";
      };

      emoji = {
        package = pkgs.noto-fonts-color-emoji;
        name = "Noto Color Emoji";
      };
    };
  };

  home.packages = with pkgs; [
    qogir-icon-theme
    rose-pine-icon-theme
  ];

}
