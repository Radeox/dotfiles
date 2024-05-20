{ ... }: {
  services.kanshi =
    {
      enable = true;

      settings = [
        {
          # Work profile
          profile.name = "pixel";
          profile.outputs = [
            {
              criteria = "HDMI-A-1";
              position = "0,0";
            }
            {
              criteria = "DP-2";
              position = "1920,0";
            }
            {
              criteria = "eDP-1";
              position = "3840,0";
            }
            {
              # Bug in Hyprland/Nvidia driver
              criteria = "Unknown-1";
              status = "disable";
            }
          ];
        }
        {
          # Home profile
          profile.name = "home";
          profile.outputs = [
            {
              criteria = "eDP-1";
              position = "0,0";
            }
            {
              criteria = "HDMI-A-1";
              position = "1600,0";
            }
            {
              # Bug in Hyprland/Nvidia driver
              criteria = "Unknown-1";
              status = "disable";
            }
          ];
        }
      ];
    };
}
