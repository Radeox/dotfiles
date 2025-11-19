{ pkgs, ... }: {
  # Rofi configuration
  programs.rofi = {
    enable = true;

    # Plugins
    plugins = with pkgs; [
      rofi-power-menu
    ];

    # Extra configuration for Rofi
    extraConfig = {
      modes = "window,drun,run,ssh,combi,power-menu:${pkgs.rofi-power-menu}/bin/rofi-power-menu";
    };
  };
}
