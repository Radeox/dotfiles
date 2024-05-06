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

    # Add legion module
    extraModulePackages = [
      config.boot.kernelPackages.lenovo-legion-module
      config.boot.kernelPackages.nvidia_x11
    ];
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
  };

  # System packages
  environment.systemPackages = with pkgs;
    [
      # New stuff
      acpi
      adwaita-qt
      adwaita-qt6
      brightnessctl
      fuseiso
      gnome.adwaita-icon-theme
      gnome.file-roller
      gnome.gnome-themes-extra
      grimblast
      gsettings-desktop-schemas
      hyprcursor
      hypridle
      hyprland-protocols
      hyprlock
      hyprpicker
      kanshi
      libva-utils
      pavucontrol
      playerctl
      polkit_gnome
      qt5.qtwayland
      qt6.qmake
      qt6.qtwayland
      swaynotificationcenter
      swww
      udiskie
      waybar
      wl-clipboard
      wofi
      xdg-desktop-portal
      xdg-desktop-portal-gtk
      xdg-desktop-portal-hyprland
      xdg-utils
      loupe

      # OLD
      alacritty
      android-tools
      ansible
      autojump
      bat
      bottom
      cargo
      cifs-utils
      cmake
      dig
      du-dust
      duf
      fd
      ffmpeg
      firefox
      fzf
      gcc
      gimp
      git
      git-extras
      gnumake
      grc
      gruvbox-gtk-theme
      heroic
      home-manager
      htop
      imagemagick
      inkscape
      killall
      lazydocker
      lazygit
      localsend
      lsd
      mariadb.client
      megasync
      mongodb-compass
      mongodb-tools
      nil
      nixfmt-classic
      nmap
      nodejs_20
      noto-fonts
      libreoffice-fresh
      pciutils
      php83
      poetry
      prismlauncher
      python312
      quickemu
      rar
      remmina
      ripgrep
      rpi-imager
      rpiboot
      sbctl
      telegram-desktop
      thunderbird
      tree-sitter
      unzip
      veracrypt
      vifm
      vlc
      vorta
      wget
      wl-clipboard
      zip

      (google-chrome.override
        {
          commandLineArgs = [
            "--use-gl=egl"
            "--enable-zero-copy"
            "--enable-features=VaapiVideoDecodeLinuxGL"
            "--ignore-gpu-blocklist"
            "--enable-gpu-rasterization"
            "--ozone-platform=wayland"
          ];
        })
    ] ++ (with pkgs.fishPlugins; [ done fzf-fish grc hydro sponge ]);

  services = {
    xserver = {
      # Enable X11
      enable = true;

      # Enable GDM
      displayManager =
        {
          gdm = {
            enable = true;
            wayland = true;
          };
        };

      # Use the nvidia driver
      videoDrivers = [ "nvidia" ];

      # Configure keymap in X11
      xkb = {
        layout = "us";
        variant = "";
      };

      # Remove xterm from the default packages
      excludePackages = [ pkgs.xterm ];
    };

    # Enable touchpad support
    libinput.enable = true;

    # Enable printing services
    printing.enable = true;

    # Enable Samba shares and other stuff
    gvfs.enable = true;
    dbus.enable = true;
    tumbler.enable = true;

    # Thermald
    thermald.enable = true;

    # Power profiles
    power-profiles-daemon.enable = true;

    # Enable Bluetooth
    blueman.enable = true;

    # Enable firmware updates
    fwupd.enable = true;

    # Enable network discovery
    avahi = {
      enable = true;
      nssmdns4 = true;
      openFirewall = true;
    };

    # Enable GNOME keyring
    gnome = {
      gnome-keyring.enable = true;
    };

    # Pipewire configuration
    pipewire = {
      enable = true;
      alsa.enable = true;
      alsa.support32Bit = true;
      pulse.enable = true;
    };
  };

  # For pipewire
  security.rtkit.enable = true;

  programs = {
    # Enable Fish
    fish.enable = true;

    # Configure Steam
    steam.enable = true;

    # Enable Gamemode
    gamemode.enable = true;

    # Enable GTK themes in Wayland
    dconf.enable = true;

    # Enable Hyprland
    hyprland = {
      enable = true;
      xwayland.enable = true;
    };

    # Enable Thunar filemanager
    thunar = {
      enable = true;
      plugins = with pkgs.xfce; [
        thunar-archive-plugin
        thunar-media-tags-plugin
        thunar-volman
      ];
    };

    # Enable xfconf (required for thunar)
    xfconf.enable = true;
  };

  # Set Fish as default shell
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
    stateVersion = "24.05";
  };

  # Enable Docker
  virtualisation = {
    docker = {
      enable = true;
      enableNvidia = true;
      liveRestore = false;
    };
  };

  # XDG Portals
  xdg = {
    autostart.enable = true;
    portal = {
      enable = true;
      extraPortals = [
        pkgs.xdg-desktop-portal
        pkgs.xdg-desktop-portal-gtk
      ];
    };
  };

  hardware = {
    nvidia = {
      # Modesetting is needed for most wayland compositors
      modesetting.enable = true;

      # Power management
      powerManagement.enable = true;

      # Force full composition pipeline
      forceFullCompositionPipeline = true;

      # Open source driver
      open = false;

      # Nvidia settings GUI
      nvidiaSettings = true;

      # Use lastest drivers
      package = config.boot.kernelPackages.nvidiaPackages.stable;
    };

    # Bluetooth setup
    bluetooth = {
      enable = true;
      powerOnBoot = true;

      # Show battery levels for more devices
      settings.General = { Experimental = true; };
    };

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
      setLdLibraryPath = true;

      extraPackages = with pkgs; [
        egl-wayland
        libGL
        libglvnd
        libvdpau-va-gl
        nvidia-vaapi-driver
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

  environment = {
    sessionVariables = {
      # Set env programs
      BROWSER = "firefox";
      EDITOR = "nvim";
      GIT_EDITOR = "nvim";
      TERMINAL = "alacritty";

      # Set Wayland ozone backend
      NIXOS_OZONE_WL = "1";
      # ELECTRON_OZONE_PLATFORM_HINT = "wayland";

      # Hyprland + Wayland + Nvidia
      CLUTTER_BACKEND = "wayland";
      GBM_BACKEND = "nvidia-drm";
      GSETTINGS_SCHEMA_DIR = "${pkgs.gsettings-desktop-schemas}/share/gsettings-schemas/${pkgs.gsettings-desktop-schemas.name}/glib-2.0/schemas";
      GTK_USE_PORTAL = "1";
      LIBVA_DRIVER_NAME = "nvidia";
      NIXOS_XDG_OPEN_USE_PORTAL = "1";
      POLKIT_AUTH_AGENT = "${pkgs.polkit_gnome}/libexec/polkit-gnome-authentication-agent-1";
      SDL_VIDEODRIVER = "wayland";
      WLR_NO_HARDWARE_CURSORS = "1";
      WLR_RENDERER = "vulkan";
      XDG_CURRENT_DESKTOP = "Hyprland";
      XDG_SESSION_DESKTOP = "Hyprland";
      XDG_SESSION_TYPE = "wayland";
      _JAVA_AWT_WM_NONREPARENTING = "1";
      __GLX_VENDOR_LIBRARY_NAME = "nvidia";
    };

    # Add ./local/bin to PATH
    localBinInPath = true;

    # My shell aliases
    shellAliases = {
      # NixOS commands
      nix-clean =
        "sudo nix-collect-garbage -d && nix-collect-garbage -d && sudo nixos-rebuild boot";
      nix-config = "cd /etc/nixos && vim configuration.nix";
      nix-update = "nix flake update /etc/nixos && sudo nixos-rebuild switch";

      # Aliases
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
      ls = "lsd --group-directories-first";

      # Scripts
      myip = "bash ~/Sources/scripts/my-ip.sh";
      venv = "source ~/Sources/scripts/activate_poetry.fish";
    };
  };
}
