{ ... }: {
  programs.lazygit = {
    enable = true;

    settings = {
      "notARepository" = "quit";
    };
  };
}
