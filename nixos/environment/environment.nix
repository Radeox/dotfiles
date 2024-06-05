{ pkgs, ... }:
{
  environment.sessionVariables = {
    # Program variables
    BROWSER = "firefox";
    EDITOR = "nvim";
    GIT_EDITOR = "nvim";
    TERMINAL = "alacritty";

    # NixOS variables
    NIXOS_OZONE_WL = "1";
    NIXOS_XDG_OPEN_USE_PORTAL = "1";

    # XDG variables
    XDG_CURRENT_DESKTOP = "Hyprland";
    XDG_SESSION_DESKTOP = "Hyprland";
    XDG_SESSION_TYPE = "wayland";

    # Toolkit variables
    QT_QPA_PLATFORM = "wayland";
    QT_QPA_PLATFORMTHEME = "qt6ct";
    SDL_VIDEODRIVER = "wayland";

    # Miscellaneous variables
    GTK_USE_PORTAL = "1";
    POLKIT_AUTH_AGENT = "${pkgs.polkit_gnome}/libexec/polkit-gnome-authentication-agent-1";
    WLR_NO_HARDWARE_CURSORS = "1";
    _JAVA_AWT_WM_NONREPARENTING = "1";
  };
}
