{ ... }:
{
  imports = [
    ./display-manager.nix
    ./kernel.nix
    ./misc.nix
    ./networking.nix
    ./nixos.nix
    ./secureboot.nix
    ./virt.nix
  ];
}
