# Encrypt secondary drives and unlock them automatically

1. Encrypt the drive and create the filesystem on it (LVM is used in this example):

```bash
cryptsetup luksFormat --label CRYPTSTORAGE /dev/sdb
cryptsetup open /dev/sdb cryptstorage
pvcreate /dev/mapper/cryptstorage
vgcreate vg-storage /dev/mapper/cryptstorage
lvcreate -l 100%FREE -n storage vg-storage
mkfs.ext4 -L STORAGE /dev/vg-storage/storage
```

2. Create a keyfile stored on your root partition to unlock the second drive just before booting completes.
This can be done using the /etc/crypttab file

First, create a keyfile for your secondary drive, store it safely and add it as a LUKS key:

```bash
dd bs=512 count=4 if=/dev/random of=/root/mykeyfile.key iflag=fullblock
chmod 400 /root/mykeyfile.key
cryptsetup luksAddKey /dev/sdb /root/mykeyfile.key
```

3. Next, create /etc/crypttab in configuration.nix using the following option (replacing UUID-OF-SDB with the actual UUID of /dev/sdb):

```nix
{
  environment.etc.crypttab = {
    mode = "0600";
    text = ''
      # <volume-name> <encrypted-device> [key-file] [options]
      cryptstorage UUID=UUID-OF-SDB /root/mykeyfile.key
    '';
  };
}
```

4. The secondary drive will be unlocked and made available under /dev/mapper/cryptstorage for mounting.
