{ ... }:
{
  programs.tofi = {
    enable = true;
    catppuccin.enable = false;

    settings = {
      anchor = "top";
      width = "100%";
      height = "20";
      horizontal = "true";

      font-size = "12";
      prompt-text = ">   ";
      font = "monospace";

      outline-width = "0";
      border-width = "0";
      min-input-width = "120";
      result-spacing = "18";

      padding-top = "0";
      padding-bottom = "0";
      padding-left = "0";
      padding-right = "0";

      background-color = "#24273a";
      prompt-color = "#b7bdf8";
      selection-color = "#a6da95";
      text-color = "#939ab7";
    };
  };
}
