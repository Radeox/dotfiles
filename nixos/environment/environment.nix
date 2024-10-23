{ ... }:
{
  environment.sessionVariables = {
    # Program variables
    BROWSER = "brave";
    EDITOR = "nvim";
    GIT_EDITOR = "nvim";
    TERMINAL = "kitty";

    # NixOS variables
    NIXOS_OZONE_WL = "1";
    NIXOS_XDG_OPEN_USE_PORTAL = "1";
  };
}
