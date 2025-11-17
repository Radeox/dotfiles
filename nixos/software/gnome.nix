{ pkgs, ... }:
{
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

  # Extra GNOME packages
  environment.systemPackages = with pkgs; [
    gnome-shell-extensions
    gnome-text-editor
    gnome-tweaks
  ];

  # Exclude unwanted GNOME applications
  environment.gnome.excludePackages = with pkgs; [
    atomix
    epiphany
    geary
    gnome-characters
    gnome-font-viewer
    gnome-music
    gnome-photos
    gnome-terminal
    gnome-tour
    gnome-user-docs
    hitori
    iagno
    orca
    tali
    totem
    yelp
  ];

  # Remove xterm from the default packages
  services.xserver.excludePackages = [ pkgs.xterm ];
}
