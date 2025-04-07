{ ... }: {
  imports = [
    ./display-manager.nix
    ./flatpak.nix
    ./networking.nix
    ./packages.nix
    ./programs.nix
    ./secureboot.nix
    ./services.nix
    ./system.nix
  ];
}
