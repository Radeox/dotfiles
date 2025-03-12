# Encrypt secondary drives and unlock them automatically

1. Encrypt the drive and create the filesystem on it (LVM is used in this example):

```bash
sudo cryptsetup luksFormat --type=luks2 /dev/sdb
sudo cryptsetup open /dev/sdb cryptstorage
sudo vgcreate vg-storage /dev/mapper/cryptstorage
sudo lvcreate --name storage -l +100%FREE vg-storage 
sudo mkfs.ext4 -L Storage /dev/vg-storage/storage
```

2. Create a keyfile stored on your root partition to unlock the second drive just before booting completes.
This can be done using the /etc/crypttab file

First, create a keyfile for your secondary drive, store it safely and add it as a LUKS key:

```bash
sudo dd bs=512 count=4 if=/dev/random of=/root/storage.key iflag=fullblock
sudo chmod 400 /root/storage.key
sudo cryptsetup luksAddKey /dev/sdb /root/storage.key
```

3. Next, create /etc/crypttab in configuration.nix using the following option (replacing UUID-OF-SDB with the actual UUID of /dev/sdb):

```nix
{
  environment.etc.crypttab = {
    mode = "0600";
    text = ''
      # <volume-name> <encrypted-device> [key-file] [options]
      cryptstorage UUID=UUID-OF-SDB /root/storage.key
    '';
  };
}
```

4. The secondary drive will be unlocked and made available under /dev/mapper/cryptstorage for mounting.
