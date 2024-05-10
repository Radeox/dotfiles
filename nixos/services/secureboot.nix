{ lib, ... }: {
  # Bootloader configuration
  boot = {
    # Enable secure boot
    bootspec.enable = true;
    loader.systemd-boot.enable = lib.mkForce false;

    lanzaboote = {
      enable = true;
      pkiBundle = "/etc/secureboot";
    };

    # Setup keyfile
    initrd.secrets = { "/crypto_keyfile.bin" = null; };
  };
}
