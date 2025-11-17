{ ... }:
{
  # HyprPaper
  services.hyprpaper = {
    enable = true;
    settings = {
      ipc = "on";
      splash = false;
      splash_offset = 2.0;

      preload = [
        "/home/radeox/Pictures/Wallpapers/wall10.png"
      ];

      wallpaper = [
        ", /home/radeox/Pictures/Wallpapers/wall10.png"
      ];
    };
  };
}
