{ ... }:
{
  # Hyprlock configuration
  programs.hyprlock = {
    enable = true;

    settings = {
      general = {
        disable_loading_bar = true;
        hide_cursor = true;
        grace = 10;
        no_fade_in = false;
      };

      background = [
        {
          path = "screenshot";
          blur_passes = 3;
          blur_size = 7;
        }
      ];

      input-field = [
        {
          size = "200, 50";
          position = "0, 0";
          monitor = "";
          dots_center = true;
          fade_on_empty = false;
          font_color = "rgb(211, 198, 170)";
          inner_color = "rgb(64, 60, 56)";
          outer_color = "rgb(45, 42, 39)";
          outline_thickness = 5;
          placeholder_text = ''<span foreground="##a7c080">Password...</span>'';
          shadow_passes = 2;
        }
      ];
    };
  };
}
