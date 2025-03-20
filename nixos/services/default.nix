{ ... }: {
  imports = [
    ./cleaning.nix
    ./display-manager.nix
    ./flatpak.nix
    ./kernel.nix
    ./misc.nix
    ./networking.nix
    ./nixos.nix
    ./secureboot.nix
  ];
}
