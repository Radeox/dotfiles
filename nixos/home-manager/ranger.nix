{ ... }: {
  programs.ranger = {
    enable = true;

    extraConfig = ''
      set preview_images true
      set preview_images_method kitty
      map dd shell mv %s ~/.local/share/Trash/files/
    '';
  };
}
