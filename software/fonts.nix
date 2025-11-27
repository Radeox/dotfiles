{ pkgs, ... }:
{
  # Install fonts
  environment.systemPackages = with pkgs; [
    noto-fonts
  ];

  # Configure extra fonts
  fonts.packages = with pkgs; [
    nerd-fonts.droid-sans-mono
    nerd-fonts.fira-code
    nerd-fonts.jetbrains-mono
  ];
}
