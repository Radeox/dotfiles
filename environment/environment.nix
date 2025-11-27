{ ... }:
{
  environment = {
    sessionVariables = {
      # Program variables
      BROWSER = "zen";
      EDITOR = "zeditor";
      GIT_EDITOR = "nvim";
      TERMINAL = "ghostty";

      # NixOS variables
      NIXOS_OZONE_WL = "1";
      NIXOS_XDG_OPEN_USE_PORTAL = "1";
      WLR_NO_HARDWARE_CURSORS = "1";

      # Cursor theme
      XCURSOR_THEME = "Qogir-Manjaro-Dark";
      XCURSOR_SIZE = "28";
      HYPRCURSOR_THEME = "Qogir-Manjaro-Dark";
      HYPRCURSOR_SIZE = "28";
    };

    # Add ./local/bin to PATH
    localBinInPath = true;
  };
}
