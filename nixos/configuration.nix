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
  };

  # System packages
  environment.systemPackages = with pkgs;
    [
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
      gcolor3
      gimp
      git
      git-extras
      gnumake
      google-chrome
      grc
      gruvbox-gtk-theme
      heroic
      home-manager
      htop
      imagemagick
      inkscape
      kdePackages.kdeconnect-kde
      kdePackages.powerdevil
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
      nixfmt
      nmap
      nodejs_20
      noto-fonts
      onlyoffice-bin_latest
      pciutils
      php82
      poetry
      prismlauncher
      python312
      qogir-icon-theme
      quickemu
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
    ] ++ (with pkgs.fishPlugins; [ done fzf-fish grc hydro sponge ]);

  services = {
    # Enable KDE Plasma
    desktopManager.plasma6.enable = true;

    xserver = {
      # Enable X11
      enable = true;

      # Use the nvidia driver
      videoDrivers = [ "nvidia" ];

      displayManager = {
        sddm = {
          enable = true;
          wayland.enable = true;
        };
      };

      # Configure keymap in X11
      xkb = {
        layout = "us";
        variant = "";
      };

      # Enable touchpad support
      libinput.enable = true;
    };

    # Enable printing services
    printing.enable = true;

    # Enable network discovery
    avahi = {
      enable = true;
      nssmdns4 = true;
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
    # Enable Fish
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
        nvidiaBusId = "PCI:1:0:0";
        intelBusId = "PCI:0:2:0";
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
      package = config.boot.kernelPackages.nvidiaPackages.beta;
    };

    # Bluetooth setup
    bluetooth = {
      enable = true;

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

  # Override insecure packages
  nixpkgs.config.permittedInsecurePackages =
    [ "freeimage-unstable-2021-11-01" ];

  environment = {
    sessionVariables = {
      # Set Wayland ozone backend
      NIXOS_OZONE_WL = "1";

      # Set GIT editor
      GIT_EDITOR = "nvim";
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
      myip = "bash ~/Sources/scripts/my-ip.sh";
      venv = "source ~/Sources/scripts/activate_poetry.fish";
    };
  };
}
