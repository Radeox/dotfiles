### Steam enable RTX:

`PROTON\_HIDE\_NVIDIA\_GPU=0 PROTON\_ENABLE\_NVAPI=1 VKD3D\_CONFIG=dxr11 %command%`

### Pair logitech mouse

```bash
nix-shell -p ltunify
sudo ltunify pair
```

### Set power profile

```bash
powerprofilesctl list
powerprofilesctl set performance
```
