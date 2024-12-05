{
  description = "Radeox - NixOS";

  inputs = {
    # Nixpkgs
    nixpkgs.url = "github:nixos/nixpkgs/nixos-24.11";

    # Flatpak manager
    nix-flatpak.url = "github:gmodena/nix-flatpak/?ref=v0.5.1";

    # Catppuccin theme
    catppuccin.url = "github:catppuccin/nix";
    catppuccin-vsc.url = "https://flakehub.com/f/catppuccin/vscode/*.tar.gz";

    # Manage dotfiles
    home-manager = {
      url = "github:nix-community/home-manager/release-24.11";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # VSCode extensions manager
    nix-vscode-extensions = {
      url = "github:nix-community/nix-vscode-extensions";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # Secure boot
    lanzaboote = {
      url = "github:Nix-Community/lanzaboote";
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
