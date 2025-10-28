{ pkgs, ... }: {
  programs = {
    # Bat configuration
    bat = {
      enable = true;
      extraPackages = with pkgs.bat-extras; [
        batdiff
        # batgrep
        batman
        batwatch
        prettybat
      ];
    };
    # Ranger configuration
    ranger = {
      enable = true;

      extraConfig = ''
        set preview_images true
        map dd shell mv %s ~/.local/share/Trash/files/
      '';
    };
  };

  services = {
    # MegaSync configuration
    megasync.enable = true;
  };
}
