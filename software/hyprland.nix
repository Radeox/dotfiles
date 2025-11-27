{ ... }:
{
  # Enable Hyprland
  programs.hyprland = {
    enable = true;
    withUWSM = true;
  };

  # Enable GDM (for login)
  services.displayManager = {
    gdm.enable = true;
    gdm.wayland = true;
  };
}
