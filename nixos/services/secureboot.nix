{ ... }: {
  # Secure boot
  boot.lanzaboote = {
    enable = true;
    pkiBundle = "/var/lib/sbctl";
  };

  # TPM2
  security.tpm2.enable = true;
}
