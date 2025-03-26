# Fix deleted systemd boot #

1. Get a NixOS install driver and in the boot menu open `rEFIfind` to boot your system.

2. Reinstall bootloader (I don't know what fixed it exactly):

```
sudo nixos-rebuild --install-bootloader boot
sudo bootctl install
```

3. Check if it's okey:

```
sudo bootctl status
```

4. Fix secure-boot
