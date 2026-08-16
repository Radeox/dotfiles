{ ... }:
{
  # Shell Aliases
  environment.shellAliases = {
    # NixOS commands
    nix-update = "sudo nix flake update --flake /etc/nixos && sudo nixos-rebuild switch --accept-flake-config --flake /etc/nixos && flatpak update -y";
    nix-rebuild = "sudo nixos-rebuild switch --accept-flake-config --flake /etc/nixos";
    nix-rebuild-single-job = "sudo nixos-rebuild switch --accept-flake-config --flake /etc/nixos --max-jobs 1";
    nix-config = "cd /etc/nixos && vim";
    nix-clean = "sudo nix-collect-garbage -d && sudo nixos-rebuild boot";

    # General Aliases
    ai = "aichat";
    d = "lazydocker";
    dc = "docker compose";
    g = "lazygit";
    ll = "ls -l";
    p = "ps aux | grep ";
    x = "yazi";
    rgrep = "rg";
    sl = "ls";
    sudo = "sudo ";
    a = "antigravity-ide . && exit";
    kill-ag = "pkill -9 -f antigravity-ide && pkill -9 -f antigravity";

    # Replacement Aliases
    cat = "bat -p";
    df = "duf";
    du = "dust";
  };
}
