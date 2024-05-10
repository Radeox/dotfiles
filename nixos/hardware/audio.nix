{ ... }:
{
  # Pipewire configuration
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
  };

  # For pipewire
  security.rtkit.enable = true;

  # Disable pulseaudio
  hardware.pulseaudio.enable = false;
}
