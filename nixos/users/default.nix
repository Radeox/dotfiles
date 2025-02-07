{ pkgs, ... }: {
  # Users definition
  users.users.radeox = {
    isNormalUser = true;
    description = "Radeox";
    extraGroups = [
      "adbusers"
      "docker"
      "kvm"
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
