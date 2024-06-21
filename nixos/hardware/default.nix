{ pkgs, ... }:
{
  imports = [
    ./audio.nix
    ./bluetooth.nix
  ];

  hardware = {
    # Enable graphics drivers
    graphics.enable = true;

    # Enable the Xbox One controller driver
    xone.enable = true;

    # Enable support for SANE scanners
    sane = {
      enable = true;
      extraBackends = [ pkgs.sane-airscan ];
    };
  };
}
