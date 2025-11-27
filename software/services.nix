{ ... }:
{
  services = {
    # Enable touchpad support
    libinput.enable = true;

    # Enable printing services
    printing.enable = true;

    # Enable Samba shares and other stuff
    gvfs.enable = true;
    dbus.enable = true;
    tumbler.enable = true;

    # Thermald
    thermald.enable = true;

    # Power profiles
    power-profiles-daemon.enable = true;

    # Enable firmware updates
    fwupd.enable = true;

    # Enable network discovery
    avahi = {
      enable = true;
      nssmdns4 = true;
      openFirewall = true;
    };

    # Enable GNOME keyring
    gnome.gnome-keyring.enable = true;
  };

  security = {
    # Enable polkit
    polkit.enable = true;

    # Enable Hyprland PAM integration with GNOME keyring
    pam.services.hyprland.enableGnomeKeyring = true;
  };
}
