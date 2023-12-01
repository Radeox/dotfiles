{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-23.11";
    nixpkgs-unstable.url = "github:NixOS/nixpkgs/nixos-unstable";
    home-manager.url = "github:Nix-Community/home-manager/release-23.11";
    lanzaboote.url = "github:Nix-Community/lanzaboote";
  };

  outputs = { nixpkgs, nixpkgs-unstable, home-manager, lanzaboote, ... }:
    let
      system = "x86_64-linux";
      overlay-unstable = final: prev: {
        unstable = import nixpkgs-unstable {
          inherit system;
          config.allowUnfree = true;
        };

      };
    in {
      nixosConfigurations."Radeox-Nix" = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        modules = [
          # Lanzaboote is a tool to sign NixOS builds for secure boot
          lanzaboote.nixosModules.lanzaboote

          # Home manager is used to generate dotfiles automatically
          home-manager.nixosModules.home-manager
          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.users.radeox = import ./home.nix;
          }

          # Overlays-module makes "pkgs.unstable" available in configuration.nix
          ({ config, pkgs, ... }: { nixpkgs.overlays = [ overlay-unstable ]; })

          # My NixOS configuration
          ./configuration.nix
        ];
      };
    };
}
