{ ... }: {
  environment.shellAliases = {
    # NixOS commands
    nix-clean = "sudo nix-collect-garbage -d && nix-collect-garbage -d && sudo nixos-rebuild boot";
    nix-config = "cd /etc/nixos && vim";
    nix-update = "sudo nix-channel --update && sudo nix flake update --flake /etc/nixos && sudo nixos-rebuild switch --accept-flake-config --flake /etc/nixos && flatpak update -y";
    nix-rebuild = "sudo nixos-rebuild switch --flake /etc/nixos";

    # Aliases
    ai = "aichat";
    c = "code .";
    d = "podman-tui";
    dc = "docker compose";
    g = "lazygit";
    ll = "ls -l";
    p = "ps aux | grep ";
    r = "ranger";
    rgrep = "rg";
    sl = "ls";
    sudo = "sudo ";

    # Basic commands
    cat = "bat -p";
    df = "duf";
    du = "dust";
    ls = "eza --icons --group-directories-first";
  };
}
