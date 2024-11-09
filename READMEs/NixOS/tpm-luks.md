# Auto unlock LUKS partition using TPM2 module

Required stuff

- LUKS2 partition header
- Secure boot
- `tpm2-tss` and `tpm2-tools` packages

1. Enroll your key to TPM with your encrypted partion:

```
sudo systemd-cryptenroll --tpm2-device=auto --tpm2-pcrs=0+2+7+12 --wipe-slot=tpm2 /dev/sdX
```

2. If you get the error `Failed to unseal secret using TPM2: State not recoverable` then the TPM is in locked state
   and need to be cleared, to do it:

- `echo 5 | sudo tee /sys/class/tpm/tpm0/ppi/request`
- Reboot
- `tpm2_dictionarylockout -Tdevice:/dev/tpmrm0 --setup-parameters --max-tries=5 --clear-lockout`

And retry the first step
