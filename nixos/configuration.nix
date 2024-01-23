# Radeox - Nix #

{ config, lib, pkgs, ... }:

{
  # Include external configuration
  imports = [ ./hardware-configuration.nix ];

  # Bootloader configuration
  boot = {
    # Use latest kernel
    kernelPackages = pkgs.linuxPackages_latest;

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

    # Add legion module
    extraModulePackages = [ config.boot.kernelPackages.lenovo-legion-module ];
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
    extraGroups = [ "docker" "lp" "networkmanager" "scanner" "video" "wheel" ];
    packages = (with pkgs; [
      android-tools
      authenticator
      discord
      heroic
      inkscape
      lazydocker
      lazygit
      localsend
      mariadb.client
      megasync
      mongodb-compass
      mongodb-tools
      ngrok
      openfortivpn
      prismlauncher
      protonup-qt
      remmina
      rpi-imager
      rpiboot
      spotify
      telegram-desktop
      thunderbird
      veracrypt
      vscode
      warp
      yuzu-early-access
    ]) ++ (with pkgs.gnomeExtensions; [
      appindicator
      battery-health-charging
      blur-my-shell
      dash-to-dock
      espresso
      gsconnect
      no-overview
      pano
      paperwm
      quick-settings-tweaker
      super-key
      user-themes
    ]) ++ (with pkgs.unstable; [ appflowy ]);
  };

  # System packages
  environment.systemPackages = with pkgs; [
    alacritty
    ansible
    autojump
    bat
    bottom
    cargo
    catppuccin-gtk
    cifs-utils
    cmake
    dig
    du-dust
    duf
    egl-wayland
    fd
    ffmpeg
    filezilla
    firefox
    fishPlugins.done
    fishPlugins.fzf-fish
    fishPlugins.grc
    fishPlugins.hydro
    fishPlugins.sponge
    fzf
    gcc
    gcolor3
    gimp
    git
    gnome-extension-manager
    gnome.gnome-tweaks
    gnumake
    google-chrome
    grc
    home-manager
    htop
    imagemagick
    killall
    libreoffice-fresh
    lsd
    nil
    nixfmt
    nmap
    nodejs_20
    noto-fonts
    papirus-icon-theme
    pciutils
    php82
    poetry
    python312
    qogir-icon-theme
    ripgrep
    sbctl
    tree-sitter
    ulauncher
    unzip
    vifm
    vlc
    vorta
    wayland-utils
    wget
    wl-clipboard
    zip
  ];

  # Exclude some Gnome packages
  environment.gnome.excludePackages = with pkgs; [
    gnome-console
    gnome-photos
    gnome-tour
    gnome.epiphany
    gnome.geary
    gnome.gedit
    gnome.gnome-music
    gnome.gnome-software
    gnome.gnome-terminal
    gnome.totem
  ];

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

    # Enable printing services
    printing.enable = true;

    # Enable network discovery
    avahi = {
      enable = true;
      nssmdns = true;
      openFirewall = true;
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

  # For pipewire
  security.rtkit.enable = true;

  programs = {
    # Enable FISH
    fish.enable = true;

    # Configure Steam
    steam.enable = true;

    # Enable Gamemode
    gamemode.enable = true;

    # Enable GTK themes in Wayland
    dconf.enable = true;
  };

  # Set FISH as default shell
  users.defaultUserShell = pkgs.fish;
  environment.shells = with pkgs; [ fish ];

  system = {
    # Pretty rebuild messages
    activationScripts.diff = {
      supportsDryActivation = true;
      text = ''
        ${pkgs.nvd}/bin/nvd --nix-bin-dir=${pkgs.nix}/bin diff /run/current-system "$systemConfig"
      '';
    };
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
        sync.enable = true;
      };

      # Modesetting is needed for most wayland compositors
      modesetting.enable = true;

      # Power management
      powerManagement.enable = false;

      # Open source driver
      open = false;

      # Nvidia settings GUI
      nvidiaSettings = true;

      # Use lastest drivers
      package = config.boot.kernelPackages.nvidiaPackages.stable;
    };

    # Enable bluetooth
    bluetooth.enable = true;

    # Disable pulseaudio
    pulseaudio.enable = false;

    # Enable support for SANE scanners
    sane = {
      enable = true;
      extraBackends = [ pkgs.sane-airscan ];
    };

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
    # LocalSend = 53317
    allowedTCPPorts = [ 8080 8082 9003 9080 53317 ];
    allowedUDPPorts = [ 53317 ];

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
  fonts.packages = with pkgs;
    [
      (nerdfonts.override {
        fonts = [ "FiraCode" "DroidSansMono" "JetBrainsMono" ];
      })
    ];

  nixpkgs.config.packageOverrides = pkgs: {
    # Intel hybrid driver
    vaapiIntel = pkgs.vaapiIntel.override { enableHybridCodec = true; };
  };

  environment = {
    # Set Wayland ozone backend
    sessionVariables.NIXOS_OZONE_WL = "1";

    # Add ./local/bin to PATH
    localBinInPath = true;

    # My shell aliases
    shellAliases = {
      # NixOS commands
      nix-clean = "sudo nix-collect-garbage -d && sudo nixos-rebuild boot";
      nix-config = "cd /etc/nixos && vim configuration.nix";
      nix-update = "nix flake update /etc/nixos && sudo nixos-rebuild switch";

      # Aliases
      ".." = "cd .. && ls";
      d = "lazydocker";
      dc = "docker compose";
      f = "vifm";
      find = "fd";
      g = "lazygit";
      ll = "ls -l";
      p = "ps aux | grep ";
      pr = "poetry run python";
      rgrep = "rg";
      sl = "ls";
      sudo = "sudo ";
      v = "vim";

      # Basic commands
      cat = "bat -p";
      df = "duf";
      du = "dust";
      ls = "lsd";

      # Scripts
      my-ip = "bash ~/Sources/scripts/my-ip.sh";
    };
  };
}
