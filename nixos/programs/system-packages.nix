{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    android-tools
    ansible
    autojump
    bat
    bleachbit
    bottom
    brave
    cargo
    cmake
    deluge
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
    heroic
    home-manager
    htop
    imagemagick
    killall
    lazygit
    libreoffice-fresh
    mariadb.client
    megasync
    mongodb-compass
    mongodb-tools
    moonlight-qt
    nautilus
    nmap
    nodejs_20
    noto-fonts
    orchis-theme
    pciutils
    php83
    poetry
    postman
    prismlauncher
    python312
    qogir-icon-theme
    rar
    remmina
    ripgrep
    rpi-imager
    rpiboot
    sbctl
    scrcpy
    spotify
    sshfs
    telegram-desktop
    thunderbird
    tpm2-tools
    tpm2-tss
    tree-sitter
    udiskie
    unzip
    veracrypt
    vlc
    wget
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
