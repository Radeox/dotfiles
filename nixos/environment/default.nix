{ pkgs, ... }: {
  imports = [
    ./aliases.nix
    ./environment.nix
    ./locale.nix
    ./scripts.nix
  ];

  # Add ./local/bin to PATH
  environment.localBinInPath = true;

  # Add fish to the list of shells
  environment.shells = with pkgs; [ fish ];
}
