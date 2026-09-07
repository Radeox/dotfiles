{ pkgs, lib, ... }:
{
  # Enable Niri
  programs.niri.enable = true;

  # XDG Desktop Portals
  xdg.portal = {
    enable = true;
    extraPortals = [
      pkgs.xdg-desktop-portal-wlr
      pkgs.xdg-desktop-portal-gtk
    ];

    config = {
      common = {
        default = [ "gtk" ];
      };

      gamescope = {
        default = [ "gtk" ];
      };

      niri = {
        default = lib.mkForce [
          "wlr"
          "gtk"
        ];
      };
    };
  };
}
