{ pkgs, ... }: {
  environment.systemPackages = with pkgs; [
    aichat
    ansible
    autojump
    bat
    borgbackup
    cargo
    cmake
    dig
    du-dust
    duf
    eza
    fastfetch
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
    mariadb.client
    mongodb-compass
    mongodb-tools
    nautilus
    nmap
    nodejs_20
    noto-fonts
    pciutils
    php84
    prismlauncher
    python312
    python313
    qogir-icon-theme
    rar
    remmina
    ripgrep
    rpi-imager
    sbctl
    scrcpy
    speedtest-cli
    sshfs
    thunderbird
    tpm2-tools
    tpm2-tss
    tree-sitter
    udiskie
    ungoogled-chromium
    unzip
    uv
    veracrypt
    vlc
    vorta
    wget
    whois
    wl-clipboard
    zip
  ] ++ (with pkgs.fishPlugins; [
    done
    fzf-fish
    grc
    hydro
    sponge
  ]);

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
}
