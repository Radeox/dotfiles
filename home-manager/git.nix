{ ... }:
{
  # Git configuration
  programs.git = {
    enable = true;

    extraConfig = {
      safe.directory = "/etc/nixos";
    };

    settings.user = {
      name = "Dawid Weglarz";
      email = "dawid.weglarz95@gmail.com";
    };
  };

  # Lazygit configuration
  programs.lazygit = {
    enable = true;

    settings = {
      "notARepository" = "quit";
    };
  };
}
