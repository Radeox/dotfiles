{ ... }: {
  services = {
    # Pipewire configuration
    pipewire = {
      enable = true;
      alsa.enable = true;
      alsa.support32Bit = true;
      pulse.enable = true;
    };

    # Disable pulseaudio
    pulseaudio.enable = false;
  };
}
