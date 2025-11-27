{ pkgs, ... }:
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

    # Enable gnome-settings-daemon udev rules
    udev.packages = with pkgs; [ gnome-settings-daemon ];

    # Enable network discovery
    avahi = {
      enable = true;
      nssmdns4 = true;
      openFirewall = true;
    };

    # Enable GNOME keyring
    gnome.gnome-keyring.enable = true;
  };

  # Enable polkit
  security.polkit.enable = true;

  # Enable Hyprland PAM integration with GNOME keyring
  security.pam.services.hyprland.enableGnomeKeyring = true;
}
