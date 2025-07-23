{ ... }: {
  environment.shellAliases = {
    # NixOS commands
    nix-update = "sudo nix flake update --flake /etc/nixos && sudo nixos-rebuild switch --upgrade --accept-flake-config --flake /etc/nixos && flatpak update -y";
    nix-config = "cd /etc/nixos && vim";
    nix-clean = "sudo nix-store --gc && sudo nix-collect-garbage -d && sudo nixos-rebuild boot";

    # Aliases
    ai = "aichat";
    d = "lazydocker";
    dc = "docker compose";
    g = "lazygit";
    ll = "ls -l";
    p = "ps aux | grep ";
    pixel-vpn = "sudo bash /home/radeox/Sources/Projects/PixelVPN/check_vpn.sh";
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
