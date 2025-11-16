{ pkgs, ... }: {
  # Enable Hyprland
  programs.hyprland = {
    enable = true;
    withUWSM = true;
  };

  # Enable related programs and services
  programs.hyprlock.enable = true;
  services.hypridle.enable = true;

  # Install Hyprland related packages
  environment.systemPackages = with pkgs; [
    pyprland
    hyprpicker
    hyprcursor
    hyprlock
    hypridle
    hyprpaper
    hyprsunset
    hyprpolkitagent
  ];
}
