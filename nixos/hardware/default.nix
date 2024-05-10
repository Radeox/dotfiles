{ pkgs, ... }:
{
  imports = [
    ./audio.nix
    ./bluetooth.nix
  ];

  hardware = {
    # Enable the Xbox One controller driver
    xone.enable = true;

    # Make sure opengl is enabled
    opengl = {
      enable = true;
      driSupport = true;
      driSupport32Bit = true;
      setLdLibraryPath = true;
    };

    # Enable support for SANE scanners
    sane = {
      enable = true;
      extraBackends = [ pkgs.sane-airscan ];
    };
  };
}
