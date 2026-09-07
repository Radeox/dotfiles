{ pkgs, ... }:
{
  # Enable polkit (required for Noctalia GUI to sync appearance via pkexec)
  security.polkit.enable = true;

  # Install noctalia-greeter system-wide so Polkit actions & helper binaries are registered
  environment.systemPackages = [
    pkgs.noctalia-greeter
  ];

  # Native noctalia-greeter session managed directly by greetd
  services.greetd = {
    enable = true;
    settings = {
      default_session = {
        user = "greeter";
        command = "${pkgs.noctalia-greeter}/bin/noctalia-greeter-session";
      };
    };
  };

  # Enable dconf for GTK settings
  programs.dconf.enable = true;
}
