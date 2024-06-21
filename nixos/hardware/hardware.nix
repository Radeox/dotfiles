{ pkgs, ... }: {
  hardware = {
    # Enable graphics drivers
    graphics.enable = true;

    # Enable the Xbox One controller driver
    xone.enable = true;

    # Enable bluetooth 
    bluetooth = {
      enable = true;
      powerOnBoot = true;

      # Show battery levels for more devices
      settings.General = { Experimental = true; };
    };

    # Enable support for SANE scanners
    sane = {
      enable = true;
      extraBackends = [ pkgs.sane-airscan ];
    };
  };
}
