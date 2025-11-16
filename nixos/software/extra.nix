{ pkgs, ... }:
{
  # Enable and configure some additional programs
  programs = {
    # Fish shell
    fish.enable = true;

    # Android development
    adb.enable = true;

    # Help programs expecting FHS environment
    nix-ld = {
      enable = true;
      libraries = with pkgs; [
        # Add libraries as needed
        libxcrypt
      ];
    };

    # Other stuff
    gamemode.enable = true;
    dconf.enable = true;
  };
}
