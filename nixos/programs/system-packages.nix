{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    android-tools
    ansible
    autojump
    bat
    bleachbit
    bottom
    cachix
    cargo
    cmake
    deluge
    dig
    du-dust
    duf
    eza
    ffmpeg
    firefox
    fzf
    gcc
    gimp
    git
    git-extras
    gnome-text-editor
    gnome-tweaks
    gnome.gnome-shell-extensions
    gnumake
    gparted
    grc
    heroic
    home-manager
    htop
    imagemagick
    inkscape
    killall
    lazygit
    libreoffice-fresh
    localsend
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
    vorta
    vscode
    wget
    wl-clipboard
    zip

    (google-chrome.override
      {
        commandLineArgs = [
          "--use-gl=angle"
          "--enable-zero-copy"
          "--enable-gpu-rasterization"
          "--enable-features=VaapiVideoDecodeLinuxGL"
          "--ignore-gpu-blocklist"
          "--ozone-platform=wayland"
        ];
      })
  ] ++ (with pkgs.fishPlugins; [
    done
    fzf-fish
    grc
    hydro
    sponge
  ]);

  # Configure extra fonts
  fonts.packages = with pkgs;
    [
      (nerdfonts.override {
        fonts = [ "FiraCode" "DroidSansMono" "JetBrainsMono" ];
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
