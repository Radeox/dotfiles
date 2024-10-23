{ pkgs, ... }: {
  # Users definition
  users.users.radeox = {
    isNormalUser = true;
    description = "Radeox";
    extraGroups = [
      "docker"
      "lp"
      "networkmanager"
      "scanner"
      "video"
      "wheel"
    ];
  };

  # Set Fish as default shell
  users.defaultUserShell = pkgs.fish;
}
