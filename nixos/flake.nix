{
  description = "Radeox - NixOS";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

    nix-flatpak.url = "github:gmodena/nix-flatpak/?ref=v0.4.1";

    catppuccin.url = "github:catppuccin/nix";
    catppuccin-vsc.url = "https://flakehub.com/f/catppuccin/vscode/*.tar.gz";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    lanzaboote = {
      url = "github:Nix-Community/lanzaboote";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nix-vscode-extensions = {
      url = "github:nix-community/nix-vscode-extensions";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { nixpkgs, home-manager, lanzaboote, nix-flatpak, nix-vscode-extensions, catppuccin, catppuccin-vsc, ... }: {
    nixosConfigurations = {
      Legion-Nix = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";

        modules = [
          # Lanzaboote - Secure boot
          lanzaboote.nixosModules.lanzaboote

          # Flatpak module
          nix-flatpak.nixosModules.nix-flatpak

          # Catppuccin module
          catppuccin.nixosModules.catppuccin

          # Custom overlays
          {
            nixpkgs.overlays = [
              nix-vscode-extensions.overlays.default
              catppuccin-vsc.overlays.default

              # Brave override
              (self: super: {
                brave = super.brave.override {
                  commandLineArgs = "--enable-features=TouchpadOverscrollHistoryNavigation --ozone-platform=wayland";
                };
              })
            ];
          }

          # Setup Home Manager
          home-manager.nixosModules.home-manager
          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.backupFileExtension = "backup";
            home-manager.users.radeox = {
              imports = [
                ./home-manager
                catppuccin.homeManagerModules.catppuccin
              ];
            };
          }

          # My NixOS configuration
          ./environment
          ./hardware
          ./podman
          ./programs
          ./services
          ./users

          # Tabby - Local AI model
          ./podman/tabby.nix

          # Nvidia drivers
          ./hardware/nvidia.nix

          # Host specific configuration
          ./hosts/legion.nix
        ];
      };

      B-Dell = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        modules = [
          # Lanzaboote - Secure boot
          lanzaboote.nixosModules.lanzaboote

          # Flatpak module
          nix-flatpak.nixosModules.nix-flatpak

          # Catppuccin module
          catppuccin.nixosModules.catppuccin

          # Custom overlays
          {
            nixpkgs.overlays = [
              nix-vscode-extensions.overlays.default
              catppuccin-vsc.overlays.default
            ];
          }

          # Setup Home Manager
          home-manager.nixosModules.home-manager
          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.backupFileExtension = "backup";
            home-manager.users.radeox = {
              imports = [
                ./home-manager
                catppuccin.homeManagerModules.catppuccin
              ];
            };
          }

          # My NixOS configuration
          ./environment
          ./hardware
          ./podman
          ./programs
          ./services
          ./users

          # Home Assistant + Lets encrypt
          ./podman/home-assistant.nix

          # DuckDns
          ./podman/duckdns.nix

          # Host specific configuration
          ./hosts/b-dell.nix
        ];
      };
    };
  };
}
