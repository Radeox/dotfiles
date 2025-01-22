{ ... }: {
  programs.lazygit = {
    enable = true;

    settings = {
      "notARepository" = "exit";
    };
  };
}
