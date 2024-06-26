{ ... }: {
  programs.hyprlock = {
    enable = true;

    extraConfig = ''
      # Input field for the password
      input-field {
          monitor =

          size = 200, 50
          dots_size = 0.33
          dots_spacing = 0.15
          dots_center = true
          dots_rounding = -1

          outline_thickness = 3
          outer_color = rgb(151515)
          inner_color = rgb(200, 200, 200)
          font_color = rgb(10, 10, 10)

          fade_on_empty = true
          fade_timeout = 1000
          placeholder_text = <i>Input Password...</i>
          placeholder_color = rgb(22, 22, 22)
          hide_input = false
          rounding = -1

          check_color = rgb(204, 136, 34)
          fail_color = rgb(164, 0, 0)
          fail_text =
          fail_transition = 300
          capslock_color = rgb(255, 165, 0)
          numlock_color = -1
          bothlock_color = -1
          invert_numlock = false

          position = 0, -30
          halign = center
          valign = center
      }

      # Label for the user name on laptop screen
      label {
          monitor = eDP-1
          text = $USER
          color = rgba(200, 200, 200, 1.0)

          font_size = 22
          font_family = JetBrains Mono Nerd Font

          position = -100, 160
          halign = right
          valign = bottom
      }

      # Current time
      label {
          monitor = eDP-1
          text = cmd[update:1000] echo "$(date +"%H:%M:%S")"
          color = rgba(200, 200, 200, 1.0)
          font_size = 22
          font_family = JetBrains Mono Nerd Font

          position = 100, 220
          halign = left
          valign = bottom
      }

      # Date
      label {
          monitor = eDP-1
          text = cmd[update:18000000] echo "$(date +'%d/%m/%Y')"
          color = rgba(200, 200, 200, 1.0)
          font_size = 22
          font_family = JetBrains Mono Nerd Font

          position = 100, 160
          halign = left
          valign = bottom
      }


      # Background
      background {
          monitor =
          color = rgba(22, 22, 22, 1)
      }
    '';
  };
}
