{ pkgs, ... }: {
  programs = {
    steam = {
      # Enable steam
      enable = true;

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

  # Add Heroic launcher
  environment.systemPackages = with pkgs; [
    heroic
  ];

  # Custom steam launcher in regreeted
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
        Comment=Steam Big Picture
        Exec=systemd-cat --identifier=steam-gamescope ${pkgs.gamescope}/bin/gamescope -f -e -F fsr --backend drm -- dbus-run-session ${pkgs.steam}/bin/steam -gamepadui -steamos3
        Type=Application
        EOF
      '';
    })
  ];

  nixpkgs.overlays = [
    (final: prev: {
      cantarell-fonts = prev.cantarell-fonts.overrideAttrs (oldAttrs: {
        # The failure is inside the custom font generation python script.
        # This bypasses the build step entirely if you just need the placeholder package
        # to clear the Steam/X11 dependency chain.
        dontBuild = true;
        installPhase = ''
          mkdir -p $out/share/fonts/opentype
          cp prebuilt/*.otf $out/share/fonts/opentype/ 2>/dev/null || true
          touch $out/share/fonts/opentype/placeholder-so-it-builds.otf
        '';
      });
    })
  ];
}
