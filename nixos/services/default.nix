{ ... }: {
  imports = [
    ./display-manager.nix
    ./flatpak.nix
    ./misc.nix
    ./networking.nix
    ./nixos.nix
    ./secureboot.nix
  ];
}
