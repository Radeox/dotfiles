# NixOS + Secure boot

0. Put Secure boot in setup mode

1. Create secure boot keys:

```
sudo sbctl create-keys
```

2. Add `lanzaboote` to your nix confiuration

3. Rebuild your system

4. Verify your boot entries:

```
sudo sbctl verify
```

5. Enable secure boot in BIOS.
