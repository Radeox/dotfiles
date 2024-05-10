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

    # Toolkit variables
    # GDK_BACKEND = "wayland";
    CLUTTER_BACKEND = "wayland";
    QT_QPA_PLATFORM = "wayland";
    SDL_VIDEODRIVER = "wayland";

    # XDG variables
    XDG_CURRENT_DESKTOP = "Hyprland";
    XDG_SESSION_DESKTOP = "Hyprland";
    XDG_SESSION_TYPE = "wayland";

    # Nvidia variables
    GBM_BACKEND = "nvidia-drm";
    LIBVA_DRIVER_NAME = "nvidia";
    VDPAU_DRIVER = "nvidia";

    # Miscellaneous variables
    GSETTINGS_SCHEMA_DIR = "${pkgs.gsettings-desktop-schemas}/share/gsettings-schemas/${pkgs.gsettings-desktop-schemas.name}/glib-2.0/schemas";
    GTK_USE_PORTAL = "1";
    POLKIT_AUTH_AGENT = "${pkgs.polkit_gnome}/libexec/polkit-gnome-authentication-agent-1";
    WLR_NO_HARDWARE_CURSORS = "1";
    NVD_BACKEND = "direct";
    WLR_RENDERER = "vulkan";
    _JAVA_AWT_WM_NONREPARENTING = "1";
    __GLX_VENDOR_LIBRARY_NAME = "nvidia";
  };
}
