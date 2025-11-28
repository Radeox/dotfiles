{ pkgs, ... }:
{
  # Additional packages for Hyprland
  home.packages = with pkgs; [
    brightnessctl
    cliphist
    grim
    grimblast
    hyprcursor
    hyprpicker
    networkmanagerapplet
    nwg-displays
    pavucontrol
    pyprland
    slurp
  ];

  services = {
    # Enable Hyprsunset for automatic screen temperature adjustment
    hyprsunset = {
      enable = true;

      settings =
        {
          max-gamma = 150;

          profile = [
            {
              time = "7:30";
              identity = true;
            }
            {
              time = "21:00";
              temperature = 5500;
              gamma = 0.9;
            }
          ];
        };
    };

    # Enable swww for wallpaper setting
    swww.enable = true;

    # Enable Hyprpolkit for graphical polkit authentication
    hyprpolkitagent.enable = true;
  };
}
