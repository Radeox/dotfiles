{ pkgs, ... }:
{
  environment.systemPackages = with pkgs;
    [
      alacritty
      android-tools
      ansible
      autojump
      bat
      bleachbit
      bottom
      cargo
      cmake
      deluge
      dig
      du-dust
      duf
      ffmpeg
      firefox
      fzf
      gcc
      gimp
      git
      git-extras
      gnome-text-editor
      gnome.gnome-shell-extensions
      gnome.gnome-tweaks
      gnome.nautilus
      gnumake
      gparted
      grc
      heroic
      home-manager
      htop
      imagemagick
      inkscape
      killall
      lazydocker
      lazygit
      libreoffice-fresh
      localsend
      loupe
      lsd
      mariadb.client
      megasync
      mongodb-compass
      mongodb-tools
      nmap
      nodejs_20
      noto-fonts
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
      spotify
      telegram-desktop
      thunderbird
      tree-sitter
      udiskie
      ueberzugpp
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
    gnome-photos
    gnome-tour
    gnome.atomix
    gnome.epiphany
    gnome.geary
    gnome.gnome-music
    gnome.gnome-terminal
    gnome.hitori
    gnome.iagno
    gnome.tali
    gnome.totem
  ]);
}
