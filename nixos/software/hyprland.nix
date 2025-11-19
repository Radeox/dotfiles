{ ... }:
{
  # Enable Hyprland
  programs.hyprland = {
    enable = true;
    withUWSM = true;
  };

  environment.variables = {
    XCURSOR_THEME = "Qogir-Manjaro-Dark";
    XCURSOR_SIZE = "28";
    HYPRCURSOR_THEME = "Qogir-Manjaro-Dark";
    HYPRCURSOR_SIZE = "28";
  };
}
