# Chroot into an existing NixOS install

0. Unlock and LUKS partition if present:

```
cryptsetup open <root_partition> <encrypted_partition_name>
```

1. Mount the required partitions:

```
mount /dev/mapper/<encrypted_partition_name> /mnt/
mount <boot_partition> /mnt/boot
```

2. Chroot in NixOS:

```
nixos-enter
```

3. Make all the required changes in nix configuration and rebuild with:

```
nixos-rebuild boot
```

4. Exit and reboot!
