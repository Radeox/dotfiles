{ pkgs, ... }:
{
  programs = {
    # Enable Hyprland
    # hyprland = {
    #   enable = true;
    #   xwayland.enable = true;
    # };
    #
    # # Enable Thunar filemanager
    # thunar = {
    #   enable = true;
    #   plugins = with pkgs.xfce; [
    #     thunar-archive-plugin
    #     thunar-media-tags-plugin
    #     thunar-volman
    #   ];
    # };

    # Configure Steam
    steam = {
      enable = true;
      gamescopeSession.enable = true;
    };

    # Enable Fish
    fish.enable = true;

    # Enable Gamemode
    gamemode.enable = true;

    # Enable GTK themes in Wayland
    dconf.enable = true;

    # Enable xfconf (required for thunar)
    xfconf.enable = true;
  };
}
