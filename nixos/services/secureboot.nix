{ ... }: {
  boot = {
    lanzaboote = {
      enable = true;
      pkiBundle = "/etc/secureboot";
    };
  };

  # TPM2
  security.tpm2.enable = true;
}
