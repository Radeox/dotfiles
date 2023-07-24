# Radeox - Nix #

{ config, lib, pkgs, ... }:

{
  # Include external configuration
  imports = [ ./hardware-configuration.nix ];

  # Bootloader
  boot = {
    # Use latest xanmod kernel
    kernelPackages = pkgs.linuxPackages_xanmod_latest;

    loader.systemd-boot.enable = lib.mkForce false;
    lanzaboote = {
      enable = true;
      pkiBundle = "/etc/secureboot";
    };

    # Setup keyfile
    initrd.secrets = { "/crypto_keyfile.bin" = null; };
  };

  networking = {
    # Define your hostname
    hostName = "Radeox-Nix";

    # Enable networking
    networkmanager.enable = true;
  };

  # User account
  users.users.radeox = {
    isNormalUser = true;
    description = "Radeox";
    extraGroups = [ "networkmanager" "wheel" "docker" "vboxusers" ];
    packages = with pkgs; [
      alacritty
      ansible
      authenticator
      black
      cargo
      cudatoolkit
      ffmpeg
      filezilla
      gimp
      heroic
      lazygit
      libreoffice-fresh
      libsForQt5.kdeconnect-kde
      libsForQt5.ktorrent
      lutris
      megasync
      mongodb-tools
      nodePackages.stylelint
      nodejs_20
      poetry
      prismlauncher
      remmina
      rpi-imager
      spotify
      steam
      stylua
      telegram-desktop
      thunderbird
      tree-sitter
      veracrypt
      vifm
      vlc
      vscode
      yamllint
      yuzu-mainline
    ];
  };

  # System packages
  environment.systemPackages = with pkgs; [
    autojump
    bat
    docker
    docker-compose
    du-dust
    duf
    epson-escpr
    fd
    gcc
    git
    gnumake
    gparted
    htop
    linuxPackages_latest.xone
    linuxPackages_latest.zenpower
    lsd
    neofetch
    neovim
    nixfmt
    pciutils
    python311
    python311Packages.pip
    ripgrep
    sbctl
    unzip
    vivaldi
    vivaldi-ffmpeg-codecs
    vorta
    wayland-utils
    wget
    wl-clipboard
    zip
    zsh
  ];

  # Set your time zone.
  time.timeZone = "Europe/Rome";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "it_IT.UTF-8";
    LC_IDENTIFICATION = "it_IT.UTF-8";
    LC_MEASUREMENT = "it_IT.UTF-8";
    LC_MONETARY = "it_IT.UTF-8";
    LC_NAME = "it_IT.UTF-8";
    LC_NUMERIC = "it_IT.UTF-8";
    LC_PAPER = "it_IT.UTF-8";
    LC_TELEPHONE = "it_IT.UTF-8";
    LC_TIME = "it_IT.UTF-8";
  };

  services = {
    # Enable X11
    xserver.enable = true;

    # Enable the KDE Plasma
    xserver.displayManager.sddm.enable = true;
    xserver.desktopManager.plasma5.enable = true;

    # Configure keymap in X11
    xserver = {
      layout = "us";
      xkbVariant = "";
    };

    # Enable flatpak
    flatpak.enable = true;

    # Enable printing services
    printing = {
      enable = true;
      drivers = [ pkgs.epson-escpr ];
    };

    # Enable network discovery
    avahi = {
      enable = true;
      nssmdns = true;
    };

    # Pipewire configuration
    pipewire = {
      enable = true;
      alsa.enable = true;
      alsa.support32Bit = true;
      pulse.enable = true;
    };

    # Enable touchpad support
    xserver.libinput.enable = true;

    # Disable power profiles
    power-profiles-daemon.enable = false;

    # TLP configuration
    tlp = {
      enable = true;

      settings = {
        # CPU frequency scaling (AC)
        CPU_SCALING_MIN_FREQ_ON_AC = 1200000;
        CPU_SCALING_MAX_FREQ_ON_AC = 3200000;

        # CPU frequency scaling (BAT)
        CPU_SCALING_MIN_FREQ_ON_BAT = 1200000;
        CPU_SCALING_MAX_FREQ_ON_BAT = 1200000;

        # Charge thresholds
        START_CHARGE_THRESH_BAT0 = 0;
        STOP_CHARGE_THRESH_BAT0 = 1;
      };
    };
  };

  # Flatpak portals
  xdg.portal.extraPortals = [ pkgs.xdg-desktop-portal-gtk ];

  # Install steam
  programs.steam = {
    enable = true;
    remotePlay.openFirewall = true;
    dedicatedServer.openFirewall = true;
  };

  # Enable sound with pipewire
  sound.enable = true;
  hardware.pulseaudio.enable = false;
  security.rtkit.enable = true;

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # Enable ZSH
  programs.zsh.enable = true;

  # Set ZSH as default shell
  users.defaultUserShell = pkgs.zsh;
  environment.shells = with pkgs; [ zsh ];

  # Set NeoVim as default editor
  programs.neovim.enable = true;
  programs.neovim.defaultEditor = true;

  # Configure extra fonts
  fonts.fonts = with pkgs;
    [
      (nerdfonts.override {
        fonts = [ "FiraCode" "DroidSansMono" "JetBrainsMono" ];
      })
    ];

  # Auto system update
  system.autoUpgrade = { enable = true; };

  # Automatic Garbage Collection
  nix.gc = {
    automatic = true;
    dates = "daily";
    options = "--delete-older-than 7d";
  };

  # Enable flakes
  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  virtualisation = {
    # Enable docker
    docker = {
      enable = true;
      enableNvidia = true;
      liveRestore = false;
    };

    # Enable virtualbox
    virtualbox.host = {
      enable = true;
      enableExtensionPack = true;
    };
  };

  # Tell Wayland to use the nvidia driver
  services.xserver.videoDrivers = [ "nvidia" ];

  # Enable Gamemode
  programs.gamemode.enable = true;

  hardware = {
    # Enable bluetooth
    bluetooth.enable = true;

    # Make sure opengl is enabled
    opengl = {
      enable = true;
      driSupport = true;
      driSupport32Bit = true;
    };

    nvidia = {
      # Modesetting is needed for most wayland compositors
      modesetting.enable = true;

      # Don't use the open source version
      open = false;

      # Disable the nvidia settings menu (not working on wayland)
      nvidiaSettings = false;

      # Enable power management
      powerManagement.enable = true;

      # Enable nvidia persistence daemon
      nvidiaPersistenced = true;

      # Driver version
      package = config.boot.kernelPackages.nvidiaPackages.latest;
    };

    # Enable the Xbox One driver
    xone = { enable = true; };
  };

  # Firewall configuration
  networking.firewall = {
    enable = true;
    allowedTCPPorts = [ 8080 8082 9080 ];
    allowedTCPPortRanges = [{
      from = 1714;
      to = 1764;
    } # KDE Connect
      ];
    allowedUDPPortRanges = [{
      from = 1714;
      to = 1764;
    } # KDE Connect
      ];
  };

  # NTFS support
  boot.supportedFilesystems = [ "ntfs" ];

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "23.05"; # Did you read the comment?
}
