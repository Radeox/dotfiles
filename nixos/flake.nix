{
  description = "Radeox - NixOS";

  inputs = {
    # Nixpkgs
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    # Flatpak manager
    nix-flatpak.url = "github:gmodena/nix-flatpak/latest";

    # NixOS hardware configurations
    nixos-hardware.url = "github:NixOS/nixos-hardware/master";

    # Manage dotfiles
    home-manager.url = "github:nix-community/home-manager/master";

    # Secure boot
    lanzaboote.url = "github:nix-community/lanzaboote/v0.4.3";
  };

  outputs = { nixpkgs, home-manager, lanzaboote, nix-flatpak, nixos-hardware, ... }:
    {
      nixosConfigurations = {
        # ----- Legion Nix configuration -----
        Legion-Nix = nixpkgs.lib.nixosSystem {
          system = "x86_64-linux";

          modules = [
            # Lanzaboote - Secure boot
            lanzaboote.nixosModules.lanzaboote

            # NixOS hardware configuration for Lenovo Legion 5
            nixos-hardware.nixosModules.lenovo-legion-16iah7h

            # Flatpak module
            nix-flatpak.nixosModules.nix-flatpak

            # Setup Home Manager
            home-manager.nixosModules.home-manager
            {
              home-manager.useGlobalPkgs = true;
              home-manager.useUserPackages = true;
              home-manager.backupFileExtension = "backup";
              home-manager.users.radeox = {
                imports = [
                  ./home-manager
                ];
              };
            }

            # My NixOS configuration
            ./environment
            ./hardware
            ./docker
            ./software
            ./display-managers

            # Host specific configuration
            ./hosts/legion.nix
          ];
        };

        # ----- Monoco configuration -----
        Monoco = nixpkgs.lib.nixosSystem {
          system = "x86_64-linux";

          modules = [
            # Lanzaboote - Secure boot
            lanzaboote.nixosModules.lanzaboote

            # Flatpak module
            nix-flatpak.nixosModules.nix-flatpak

            # Setup Home Manager
            home-manager.nixosModules.home-manager
            {
              home-manager.useGlobalPkgs = true;
              home-manager.useUserPackages = true;
              home-manager.backupFileExtension = "backup";
              home-manager.users.radeox = {
                imports = [
                  ./home-manager
                ];
              };
            }

            # My NixOS configuration
            ./environment
            ./hardware
            ./docker
            ./software
            ./display-managers

            # Host specific configuration
            ./hosts/monoco.nix
          ];
        };

        # ----- B-Dell configuration -----
        B-Dell = nixpkgs.lib.nixosSystem {
          system = "x86_64-linux";

          modules = [
            # Lanzaboote - Secure boot
            lanzaboote.nixosModules.lanzaboote

            # Flatpak module
            nix-flatpak.nixosModules.nix-flatpak

            # Setup Home Manager
            home-manager.nixosModules.home-manager
            {
              home-manager.useGlobalPkgs = true;
              home-manager.useUserPackages = true;
              home-manager.backupFileExtension = "backup";
              home-manager.users.radeox = {
                imports = [
                  ./home-manager
                ];
              };
            }

            # My NixOS configuration
            ./environment
            ./hardware
            ./docker
            ./software
            ./display-managers

            # Home Assistant + DuckDNS + Lets encrypt
            ./docker/home-assistant.nix

            # Jellyfin
            ./docker/jellyfin.nix

            # Host specific configuration
            ./hosts/b-dell.nix
          ];
        };
      };
    };
}
