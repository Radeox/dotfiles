{ pkgs, ... }:
{
  boot = {
    # Use latest zen kernel
    kernelPackages = pkgs.linuxPackages_zen;

    # NTFS support
    supportedFilesystems = [ "ntfs" ];
  };

  nix = {
    # Enable automatic optimization of the Nix store
    optimise.automatic = true;

    settings = {
      # Enable experimental features: flakes and the new nix-command
      experimental-features = [
        "nix-command"
        "flakes"
      ];

      # Automatically hard-link duplicate files in the store
      auto-optimise-store = true;

      # Increase the number of parallel download jobs (default is usually 5)
      max-substitution-jobs = 32;

      # Keep HTTP connections open to reuse them for subsequent file requests
      http-connections = 128;

      # Configure binary cache mirrors
      substituters = [
        "https://cache.nixos.org"
        "https://niri.cachix.org"
        "https://nix-community.cachix.org"
      ];

      # Public keys for binary cache signature verification
      trusted-public-keys = [
        "cache.nixos.org-1:6NCHdD59X431o0gWypbMrAURkbJ16ZPMQFGspcDShjY="
        "niri.cachix.org-1:W3ed243zqVPG6fGKSioAtAGfz2qPg5461pJG258Dp7Q="
        "nix-community.cachix.org-1:mB9FSh9qf2dCimDSUo8Zy7bkq5CX+/rkCWyvRCYg3Fs="
      ];
    };
  };

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  system = {
    stateVersion = "24.05";

    # Pretty rebuild messages
    activationScripts.diff = {
      supportsDryActivation = true;
      text = ''
        ${pkgs.nvd}/bin/nvd --nix-bin-dir=${pkgs.nix}/bin diff /run/current-system "$systemConfig"
      '';
    };
  };
}
