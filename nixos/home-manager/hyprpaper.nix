{ pkgs, ... }:
let
  # Hyprpaper random wallpaper script
  hyprpaper-random = pkgs.writeShellScriptBin "hyprpaper-random" ''
    WALLPAPER_DIR="$HOME/Pictures/Wallpapers/"
    CURRENT_WALL=$(hyprctl hyprpaper listloaded)

    # Get a random wallpaper that is not the current one
    WALLPAPER=$(find "$WALLPAPER_DIR" -type f ! -name "$(basename "$CURRENT_WALL")" | shuf -n 1)

    # Wait until hyprpaper IPC is ready
    for i in {1..50}; do
      if hyprctl hyprpaper listloaded >/dev/null 2>&1; then
        break
      fi

      sleep 0.1
    done

    # Apply the selected wallpaper
    hyprctl hyprpaper reload ,"$WALLPAPER"
  '';
in
{
  # HyprPaper
  services.hyprpaper = {
    enable = true;

    settings = {
      ipc = "on";
      splash = false;
    };
  };

  # Add the hyprpaper-random script to the systemPackages
  home.packages = [
    hyprpaper-random
  ];
}
