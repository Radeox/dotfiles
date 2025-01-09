{ pkgs, ... }: {
  environment.systemPackages = with pkgs; [
    android-tools
    ansible
    autojump
    bat
    brave
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
    lazygit
    mariadb.client
    mongodb-compass
    mongodb-tools
    nautilus
    nmap
    nodejs_20
    noto-fonts
    pciutils
    php84
    postman
    prismlauncher
    python312
    python313
    qogir-icon-theme
    rar
    remmina
    ripgrep
    rpi-imager
    rpiboot
    sbctl
    scrcpy
    speedtest-cli
    sshfs
    thunderbird
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
    (nerdfonts.override {
      fonts = [ "DroidSansMono" "FiraCode" "JetBrainsMono" ];
    })
  ];

  # Remove GNOME apps
  environment.gnome.excludePackages = (with pkgs; [
    atomix
    epiphany
    geary
    gnome-music
    gnome-photos
    gnome-terminal
    gnome-tour
    hitori
    iagno
    tali
    totem
  ]);
}
