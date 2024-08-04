{ ... }:
{
  environment.shellAliases = {
    # NixOS commands
    nix-clean = "sudo nix-collect-garbage -d && nix-collect-garbage -d && sudo nixos-rebuild boot";
    nix-config = "cd /etc/nixos && vim";
    nix-update = "sudo nix flake update /etc/nixos && sudo nixos-rebuild switch --flake /etc/nixos";
    nix-rebuild = "sudo nixos-rebuild switch --flake /etc/nixos";

    # Aliases
    d = "lazydocker";
    dc = "docker compose";
    g = "lazygit";
    ll = "ls -l";
    p = "ps aux | grep ";
    pr = "poetry run python";
    r = "ranger";
    rgrep = "rg";
    sl = "ls";
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
