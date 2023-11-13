# Radeox - Nix #

{ config, lib, pkgs, ... }:

{
  # Include external configuration
  imports = [ ./hardware-configuration.nix ];

  # Bootloader configuration
  boot = {
    # Use latest kernel
    kernelPackages = pkgs.linuxPackages_xanmod_latest;

    # Enable secure boot
    bootspec.enable = true;
    loader.systemd-boot.enable = lib.mkForce false;

    lanzaboote = {
      enable = true;
      pkiBundle = "/etc/secureboot";
    };

    # Setup keyfile
    initrd.secrets = { "/crypto_keyfile.bin" = null; };

    # Use nvidia driver
    initrd.kernelModules = [ "nvidia" ];

    # NTFS support
    supportedFilesystems = [ "ntfs" ];
  };

  # Networking configuration
  networking = {
    # Define your hostname
    hostName = "Radeox-Nix";

    # Enable networking
    networkmanager.enable = true;
  };

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  nix = {
    # Enable flakes
    settings.experimental-features = [ "nix-command" "flakes" ];
  };

  # User packages
  users.users.radeox = {
    isNormalUser = true;
    description = "Radeox";
    extraGroups = [ "docker" "networkmanager" "video" "wheel" ];
    packages = (with pkgs; [
      authenticator
      discord
      heroic
      lutris
      megasync
      mongodb-tools
      ngrok
      openfortivpn
      prismlauncher
      protonup-qt
      remmina
      rpi-imager
      steam
      thunderbird
      veracrypt
      vscode
      yuzu-mainline
    ]) ++ (with pkgs.gnomeExtensions; [
      appindicator
      dash-to-dock
      espresso
      gsconnect
      pano
      paperwm
      quick-settings-tweaker
      user-themes
    ]) ++ (with pkgs.unstable; [ anytype ]);
  };

  # System packages
  environment.systemPackages = with pkgs; [
    alacritty
    ansible
    autojump
    bat
    cargo
    catppuccin-gtk
    cifs-utils
    cmake
    docker-compose
    drill
    du-dust
    duf
    egl-wayland
    fd
    ffmpeg
    filezilla
    gcc
    gcolor3
    gimp
    git
    gnome.gnome-tweaks
    gnumake
    google-chrome
    home-manager
    htop
    imagemagick
    inkscape
    killall
    lazydocker
    lazygit
    libreoffice-fresh
    linuxPackages_xanmod_latest.xone
    lsd
    nil
    nixfmt
    nodejs_20
    noto-fonts
    papirus-icon-theme
    pciutils
    php82
    poetry
    python311
    python311Packages.ipython
    python311Packages.pip
    qogir-icon-theme
    ripgrep
    sbctl
    telegram-desktop
    tree-sitter
    unzip
    vifm
    vlc
    vorta
    wayland-utils
    wget
    wl-clipboard
    yaml-language-server
    zip
    zsh
  ];

  # Exclude some Gnome packages
  environment.gnome.excludePackages = (with pkgs; [
    gnome-console
    gnome-photos
    gnome-tour
    gnome.epiphany
    gnome.geary
    gnome.gedit
    gnome.gnome-calendar
    gnome.gnome-music
    gnome.gnome-software
    gnome.gnome-terminal
    gnome.totem
  ]);

  services = {
    xserver = {
      # Enable X11
      enable = true;

      # Use the nvidia driver
      videoDrivers = [ "nvidia" ];

      # Enable Gnome
      desktopManager.gnome.enable = true;
      displayManager = {
        gdm = {
          enable = true;
          wayland = true;
        };
      };

      # Configure keymap in X11
      layout = "us";
      xkbVariant = "";

      # Enable touchpad support
      libinput.enable = true;

      # Remove xterm from gnome-terminal
      excludePackages = [ pkgs.xterm ];
    };

    # Enable flatpak
    flatpak.enable = true;

    # Enable printing services
    printing = { enable = true; };

    # Enable network discovery
    avahi = {
      enable = true;
      nssmdns = true;
    };

    # Enable Samba shares
    gvfs.enable = true;

    # Pipewire configuration
    pipewire = {
      enable = true;
      alsa.enable = true;
      alsa.support32Bit = true;
      pulse.enable = true;
    };

    # Thermald
    thermald.enable = true;

    # Power profiles
    power-profiles-daemon.enable = true;

    # Enable firmware updates
    fwupd.enable = true;
  };

  # Enable sound with pipewire
  sound.enable = true;
  hardware.pulseaudio.enable = false;
  security.rtkit.enable = true;

  programs = {
    # Enable ZSH
    zsh.enable = true;

    # Configure Steam
    steam = {
      enable = true;
      remotePlay.openFirewall = true;
      dedicatedServer.openFirewall = true;
    };

    # Enable Gamemode
    gamemode.enable = true;

    # Enable GTK themes in Wayland
    dconf.enable = true;
  };

  # Set ZSH as default shell
  users.defaultUserShell = pkgs.zsh;
  environment.shells = with pkgs; [ zsh ];

  system = {
    # Pretty rebuild messages
    activationScripts.diff = {
      supportsDryActivation = true;
      text = ''
        ${pkgs.nvd}/bin/nvd --nix-bin-dir=${pkgs.nix}/bin diff /run/current-system "$systemConfig"
      '';
    };

    # This value determines the NixOS release from which the default
    # settings for stateful data, like file locations and database versions
    # on your system were taken. It‘s perfectly fine and recommended to leave
    # this value at the release version of the first install of this system.
    # Before changing this value read the documentation for this option
    # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
    stateVersion = "23.05";
  };

  virtualisation = {
    # Enable Docker
    docker = {
      enable = true;
      enableNvidia = true;
      liveRestore = false;
    };
  };

  hardware = {
    nvidia = {
      # Nvidia Prime
      prime = {
        intelBusId = "PCI:0:2:0";
        nvidiaBusId = "PCI:1:0:0";
        reverseSync.enable = true;
      };

      # Modesetting is needed for most wayland compositors
      modesetting.enable = true;

      # Power management
      powerManagement.enable = true;

      # Open source driver
      open = false;

      # Nvidia settings GUI
      nvidiaSettings = true;

      # Use lastest drivers
      package = config.boot.kernelPackages.nvidiaPackages.stable;
    };

    # Enable bluetooth
    bluetooth.enable = true;

    # Make sure opengl is enabled
    opengl = {
      enable = true;
      driSupport = true;
      driSupport32Bit = true;

      extraPackages = with pkgs; [
        intel-media-driver
        libvdpau-va-gl
        nvidia-vaapi-driver
        vaapiIntel
        vaapiVdpau
      ];
    };

    # Enable the Xbox One driver
    xone = { enable = true; };
  };

  # Firewall configuration
  networking.firewall = {
    enable = true;

    # Dev ports
    allowedTCPPorts = [ 8080 8082 9003 9080 ];

    # KDE Connect
    allowedTCPPortRanges = [{
      from = 1714;
      to = 1764;
    }];
    allowedUDPPortRanges = [{
      from = 1714;
      to = 1764;
    }];
  };

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

  # Configure extra fonts
  fonts.fonts = with pkgs;
    [
      (nerdfonts.override {
        fonts = [ "FiraCode" "DroidSansMono" "JetBrainsMono" ];
      })
    ];

  # Intel hybrid driver
  nixpkgs.config.packageOverrides = pkgs: {
    vaapiIntel = pkgs.vaapiIntel.override { enableHybridCodec = true; };
  };

  # Set Wayland ozone backend
  environment.sessionVariables.NIXOS_OZONE_WL = "1";

  # Add ./local/bin to PATH
  environment.localBinInPath = true;
}
