{
  description = "Radeox - NixOS";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    catppuccin.url = "github:catppuccin/nix";
    catppuccin-vsc.url = "https://flakehub.com/f/catppuccin/vscode/*.tar.gz";


    nix-vscode-extensions = {
      url = "github:nix-community/nix-vscode-extensions";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    lanzaboote = {
      url = "github:Nix-Community/lanzaboote";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { nixpkgs, home-manager, lanzaboote, catppuccin, catppuccin-vsc, nix-vscode-extensions, ... }: {
    nixosConfigurations = {
      Legion-Nix = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";

        modules = [
          # Lanzaboote - Secure boot
          lanzaboote.nixosModules.lanzaboote

          # Catppuccin module
          catppuccin.nixosModules.catppuccin

          # VSCode extensions overlay
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

          # Sunshine streaming server
          ./services/sunshine.nix

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

          # Catppuccin module
          catppuccin.nixosModules.catppuccin

          # VSCode extensions overlay
          {
            nixpkgs.overlays = [
              nix-vscode-extensions.overlays.default
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

          # Host specific configuration
          ./hosts/b-dell.nix
        ];
      };
    };
  };
}
