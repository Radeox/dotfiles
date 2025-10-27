{ ... }: {
  programs.ghostty = {
    enable = true;
    enableFishIntegration = true;

    settings = {
      theme = "Ayu";
      font-size = 13;

      keybind = [
        # "alt+up=goto_splity:up"
      ];
    };
  };
}
