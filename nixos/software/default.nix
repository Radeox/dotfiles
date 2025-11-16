{ ... }: {
  imports = [
    ./auto-upgrade.nix
    ./dev-extra.nix
    ./extra.nix
    ./flatpak.nix
    ./fonts.nix
    ./networking.nix
    ./packages.nix
    ./python.nix
    ./secureboot.nix
    ./services.nix
    ./system.nix
  ];
}
