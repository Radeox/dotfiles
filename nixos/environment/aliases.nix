{ ... }:
{
  environment.shellAliases = {
    # NixOS commands
    nix-clean = "sudo nix-collect-garbage -d && nix-collect-garbage -d && sudo nixos-rebuild boot";
    nix-config = "cd /etc/nixos && vim";
    nix-update = "flatpak update && sudo nix flake update --flake /etc/nixos && sudo nixos-rebuild switch --accept-flake-config --flake /etc/nixos";
    nix-rebuild = "sudo nixos-rebuild switch --flake /etc/nixos";

    # Aliases
    d = "podman-tui";
    dc = "docker compose";
    g = "lazygit";
    ll = "ls -l";
    p = "ps aux | grep ";
    pr = "poetry run python";
    r = "ranger";
    rgrep = "rg";
    sl = "ls";
    ssh = "kitten ssh";
    sudo = "sudo ";
    v = "vim";

    # Basic commands
    cat = "bat -p";
    df = "duf";
    du = "dust";
    ls = "eza --icons --group-directories-first";

    # Scripts
    myip = "bash ~/Sources/scripts/my-ip.sh";
    venv = "source ~/Sources/scripts/activate_poetry.fish";
  };
}
