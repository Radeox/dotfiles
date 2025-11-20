{ pkgs, ... }:
{
  home.packages = with pkgs; [
    hyprpanel
  ];
  # Hyprpanel configuration
  # programs.hyprpanel = {
  #   enable = true;
  #   systemd.enable = true;
  # };
}
