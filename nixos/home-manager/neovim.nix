{ ... }: {
  programs.neovim = {
    enable = true;
    defaultEditor = true;
    catppuccin.enable = false;

    # Enable aliases
    viAlias = true;
    vimAlias = true;

    # Enable providers
    withNodeJs = true;
    withPython3 = true;
  };
}
