{ ... }: {
  nix = {
    # Enable automatic garbage collection
    gc = {
      automatic = true;
      dates = "daily";
      options = "--delete-older-than 7d";
    };

    # Enable auto-optimisation of the store
    settings.auto-optimise-store = true;
  };
}
