{ pkgs, ... }:
let
  # 1. Generate the sxhkd audio keybind configuration
  steamSxhkdrc = pkgs.writeText "steam-sxhkdrc" ''
    XF86AudioRaiseVolume
        ${pkgs.wireplumber}/bin/wpctl set-volume -l 1.5 @DEFAULT_AUDIO_SINK@ 5%+

    XF86AudioLowerVolume
        ${pkgs.wireplumber}/bin/wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-

    XF86AudioMute
        ${pkgs.wireplumber}/bin/wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle
  '';


  # 2. Create the wrapped launch script for Steam
  startSteamSession = pkgs.writeShellScriptBin "start-steam-session" ''
    set -xeuo pipefail

    # Start the key listener using our Nix-stored config
    ${pkgs.sxhkd}/bin/sxhkd -c ${steamSxhkdrc} &

    # Execute Steam. We are using -steamos3 so it actively looks for your script!
    exec ${pkgs.dbus}/bin/dbus-run-session ${pkgs.steam}/bin/steam -steamos3 -gamepadui -pipewire-dmabuf
  '';

  # 3. Create a mock SteamOS session selection script
  steamosSessionSelect = pkgs.writeShellScriptBin "steamos-session-select" ''
    # Fork into the background to prevent Steam UI deadlock
    (
      ${pkgs.steam}/bin/steam -shutdown
    ) &
    exit 0
  '';

in {
  programs = {
    steam = {
      # Enable steam
      enable = true;

      # Disabled because the default session crashes with Regreet.
      # We use our custom session derivation below instead.
      gamescopeSession.enable = false;

      # Open firewall for games
      remotePlay.openFirewall = true;
      dedicatedServer.openFirewall = true;
      localNetworkGameTransfers.openFirewall = true;
    };

    # Enable additional stuff
    gamemode.enable = true;
    gamescope = {
      enable = true;
      capSysNice = true;
    };
  };

  # Add Heroic launcher and our custom session packages
  environment.systemPackages = with pkgs; [
    heroic
    mangohud
    startSteamSession
    steamosSessionSelect
  ];

  # Custom steam launcher for regreet to avoid DRM race conditions
  services.displayManager.sessionPackages = [
    (pkgs.stdenv.mkDerivation {
      pname = "steam-gamescope-custom-session";
      version = "1.0";
      dontUnpack = true;
      passthru.providedSessions = [ "steam-gamescope" ];

      installPhase = ''
        mkdir -p $out/share/wayland-sessions
        cat << 'EOF' > $out/share/wayland-sessions/steam-gamescope.desktop
        [Desktop Entry]
        Name=Steam
        Comment=Steam Big Picture with HDR and Audio Fixes
        Exec=systemd-cat --identifier=steam-gamescope ${pkgs.gamescope}/bin/gamescope -f -e -F fsr --backend drm --adaptive-sync --hdr-enabled --mangoapp -- ${startSteamSession}/bin/start-steam-session
        Type=Application
        EOF
      '';
    })
  ];
}
