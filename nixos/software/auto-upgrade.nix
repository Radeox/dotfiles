{ ... }: {
  system.autoUpgrade = {
    enable = true;
    operation = "boot";
    flake = "/etc/nixos";
    flags = [
      "--update-input"
      "nixpkgs"
      "--update-input"
      "rust-overlay"
      "--commit-lock-file"
    ];
    dates = "weekly";
  };
}
