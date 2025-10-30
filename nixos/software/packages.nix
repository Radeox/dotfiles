{ pkgs, ... }: {
  environment.systemPackages = with pkgs; [
    aichat
    ansible
    borgbackup
    cargo
    cmake
    dig
    duf
    dust
    fastfetch
    fd
    ffmpeg
    fzf
    gcc
    git
    git-extras
    gnome-shell-extensions
    gnome-text-editor
    gnome-tweaks
    gnumake
    gparted
    grc
    home-manager
    htop
    imagemagick
    killall
    libxcrypt
    mariadb.client
    mongodb-tools
    nautilus
    nautilus-python
    nmap
    nodejs_22
    noto-fonts
    openfortivpn
    pciutils
    php84
    python313
    qogir-icon-theme
    quickemu
    rar
    remmina
    ripgrep
    rpiboot
    sbctl
    scrcpy
    speedtest-cli
    sshfs
    tpm2-tools
    tpm2-tss
    tree-sitter
    udiskie
    unzip
    uv
    veracrypt
    vlc
    wget
    whois
    winboat
    wl-clipboard
    zip
  ];

  # Configure extra fonts
  fonts.packages = with pkgs; [
    nerd-fonts.droid-sans-mono
    nerd-fonts.fira-code
    nerd-fonts.jetbrains-mono
  ];

  # Remove GNOME apps
  environment.gnome.excludePackages = (with pkgs; [
    atomix
    epiphany
    geary
    gnome-characters
    gnome-font-viewer
    gnome-music
    gnome-photos
    gnome-terminal
    gnome-tour
    gnome-user-docs
    hitori
    iagno
    tali
    totem
    yelp
  ]);

  # Remove xterm from the default packages
  services.xserver.excludePackages = [ pkgs.xterm ];

  # Enable and configure some additional programs
  programs = {
    # Fish shell
    fish.enable = true;

    # Android development
    adb.enable = true;

    # Help programs expecting FHS environment
    nix-ld = {
      enable = true;
      libraries = with pkgs; [
        # Add libraries as needed
      ];
    };

    # Other stuff
    gamemode.enable = true;
    dconf.enable = true;
  };
}
