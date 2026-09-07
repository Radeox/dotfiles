{ pkgs, ... }:
{
  services = {
    # Enable touchpad support
    libinput.enable = true;

    # Enable printing services
    printing.enable = true;

    # Enable Samba shares and other stuff
    gvfs.enable = true;
    tumbler.enable = true;

    dbus = {
      enable = true;
      packages = [ pkgs.gcr_3 ];
    };

    # Power services
    upower.enable = true;

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

    # Syncthing configuration
    syncthing = {
      enable = true;
      openDefaultPorts = true;
      user = "radeox";
      configDir = "/home/radeox/.config/syncthing";
    };
  };

  security = {
    # Enable polkit
    polkit.enable = true;

    # Enable Niri GNOME keyring
    pam.services.niri.enableGnomeKeyring = true;
  };

  # Helps with file secrets/previews
  programs.gnome-terminal.enable = true;
}
