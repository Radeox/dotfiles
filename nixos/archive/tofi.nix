{ ... }: {
  programs.tofi = {
    enable = true;

    settings = {
      anchor = "top";
      width = "100%";
      height = "34";
      horizontal = "true";

      font-size = "12";
      prompt-text = "> ";
      font = "monospace";

      outline-width = "0";
      border-width = "6";
      min-input-width = "120";
      result-spacing = "18";

      padding-top = "0";
      padding-bottom = "0";
      padding-left = "0";
      padding-right = "0";

      background-color = "#181825";
      border-color = "#181825";
      prompt-color = "#f9e2af";
      selection-color = "#a6e3a1";
      text-color = "#cdd6f4";
    };
  };
}
