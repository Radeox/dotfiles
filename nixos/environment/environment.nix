{ ... }: {
  environment = {
    sessionVariables = {
      # Program variables
      BROWSER = "zen";
      EDITOR = "zeditor";
      GIT_EDITOR = "nvim";
      TERMINAL = "alacritty";

      # NixOS variables
      NIXOS_OZONE_WL = "1";
      NIXOS_XDG_OPEN_USE_PORTAL = "1";
    };

    # Add ./local/bin to PATH
    localBinInPath = true;
  };

  # Spice USB redirection
  virtualisation.spiceUSBRedirection.enable = true;
}
