{ pkgs, ... }:
{
  services.hypridle = {
    enable = true;
    package = pkgs.hypridle;

    settings = {
      # Screenlock
      general = {
        lock_cmd = "pidof hyprlock || hyprlock";
        before_sleep_cmd = "loginctl lock-session";
        after_sleep_cmd = "hyprctl dispatch dpms on";
      };

      listener = [
        # Dim screen after 5min
        {
          timeout = "300";
          on-timeout = "brightnessctl -s set 10";
          on-resume = "brightnessctl -r";
        }

        # Lock screen after 7min
        {
          timeout = "420";
          on-timeout = "loginctl lock-session";
        }

        # Suspend after 10min
        {
          timeout = "600";
          on-timeout = "systemctl suspend";
        }
      ];
    };
  };
}
