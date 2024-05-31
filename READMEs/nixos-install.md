# NixOS install with LUKS2 on EXT4 fs

1. Wipe the disk where you want to install NixOS:

```
wipefs -a </dev/sdX>
```

2. Create all the required partition, example:

- Boot EFI (~ 1GB)
- Root
- Optional: Swap, Home

```
cfdisk </dev/sdX>
```

3. Encrypt the drive with LUKS2:

```
cryptsetup luksFormat --type=luks2 <root_partition>
cryptsetup open <root_partition> <encrypted_partition_name>
```

4. Prepare LVM:

```
vgcreate <volume_group_name> /dev/mapper/<encrypted_partition_name>
lvcreate --name <logic_volume_name> -l +100%FREE <volume_group_name>
```

5. Create filesystems:

```
mkfs.vfat -n EFI -F 32 <boot_partition>
mkfs.ext4 -L NixOS /dev/mapper/<volume_group_name>-<logic_volume_name>
```

6. Mount the filesystem and create the minimal structure:

```
mount /dev/mapper/<volume_group_name>-<logic_volume_name> /mnt

mkdir -p /mnt/boot
mkdir -p /mnt/home
mkdir -p /mnt/nix
mkdir -p /mnt/var/log
mkdir -p /mnt/etc/nixos

mount <boot_partition> /mnt/boot
```

7. Generate minimal NixOS configuration:

```
nixos-generate-config --root /mnt
```

8. Get the UUID of the root partition:

```
blkid -s UUID <root_partition>
```

9. Add this line (changing the UUID) to `/mnt/etc/nixos/hardware-configuration.nix`:

```
boot.initrd.luks.devices.cryptroot.device = "/dev/disk/by-uuid/<root_uuid>";
```

10. Make all the changes you want, like setting up the wifi or vim :)

```
vim /mnt/etc/nixos/configuration.nix
```

11. Install NixOS!

```
nixos-install --root /mnt --cores 0
```
