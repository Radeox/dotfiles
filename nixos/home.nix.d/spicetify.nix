{ pkgs, lib, spicetify-nix, ... }:
let spicePkgs = spicetify-nix.packages.${pkgs.system}.default;
in {
  # Allow spotify to be installed if you don't have unfree enabled already
  nixpkgs.config.allowUnfreePredicate = pkg:
    builtins.elem (lib.getName pkg) [ "spotify" ];

  # Import the flake's module for your system
  imports = [ spicetify-nix.nixosModule ];

  # Configure spicetify :)
  programs.spicetify = {
    enable = true;
    theme = spicePkgs.themes.Onepunch;

    enabledExtensions = with spicePkgs.extensions; [ shuffle ];
  };
}
