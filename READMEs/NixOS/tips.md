# Some random stuff I needed

## Connect to wifi network from minimal NixOS

1. Enable network manager in `configuration.nix`:

```
networking.networkmanager.enable = true;
```

2. Rebuild your system and use:

```
nmcli dev wifi list
nmcli dev wifi connect <SSID> password <PASSWORD>
```

## Rebuild NixOS with imported configuration and flakes

```
nix flake update /etc/nixos --extra-experimental-features nix-command --extra-experimental-features flakes
nixos-rebuild switch --flake /etc/nixos#<CONFIG_HOST>
```
