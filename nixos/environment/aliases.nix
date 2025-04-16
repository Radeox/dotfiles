{ ... }: {
  environment.shellAliases = {
    # NixOS commands
    nix-update = "sudo nix-channel --update && sudo nix flake update --flake /etc/nixos && sudo nixos-rebuild switch --accept-flake-config --flake /etc/nixos && flatpak update -y";
    nix-config = "cd /etc/nixos && vim";
    nix-full-clean = "sudo nix-store --gc && sudo nix-collect-garbage -d && nix-collect-garbage -d && sudo nixos-rebuild boot";

    # Aliases
    ai = "aichat";
    d = "podman-tui";
    dc = "docker compose";
    g = "lazygit";
    ll = "ls -l";
    p = "ps aux | grep ";
    r = "ranger";
    rgrep = "rg";
    sl = "ls";
    sudo = "sudo ";
    z = "zeditor .";

    # Basic commands
    cat = "bat -p";
    df = "duf";
    du = "dust";
    ls = "eza --icons --group-directories-first";
  };
}
