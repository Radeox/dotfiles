{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    home-manager.url = "github:Nix-Community/home-manager/master";
    lanzaboote.url = "github:Nix-Community/lanzaboote";
    spicetify-nix.url = "github:the-argus/spicetify-nix";
  };

  outputs = { nixpkgs, home-manager, lanzaboote, spicetify-nix, ... }: {
    nixosConfigurations."Radeox-Nix" = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      specialArgs = { inherit spicetify-nix; };
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

        # Spicetify is a tool to customize Spotify
        ./home.nix.d/spicetify.nix

        # My NixOS configuration
        ./configuration.nix
      ];
    };
  };
}
