{ pkgs, ... }:
{
  # Rofi configuration
  programs.rofi = {
    enable = true;

    # Plugins
    plugins = with pkgs; [
      rofi-power-menu
    ];

    # Extra configuration for Rofi
    extraConfig = {
      modes = "window,drun,run,ssh,combi,power-menu:${pkgs.rofi-power-menu}/bin/rofi-power-menu";
      show-icons = true;
      icon-theme = "Papirus-Dark";
      font = "JetBrainsMono Nerd Font 12";
      display-drun = "Apps";
      display-run = "Run";
      display-window = " 﩯 Window";
      display-Network = " 󰤨 Network";
      drun-display-format = "{name}";
      window-format = "{w} · {c} · {t}";
    };

    # Everforest Theme
    theme = builtins.toString (
      pkgs.writeText "rofi-everforest.rasi" ''
        * {
          bg0: #2d353b;
          bg1: #343f44;
          bg2: #3d484d;
          bg3: #475258;
          fg0: #d3c6aa;
          fg1: #e6e2cc;
          red: #e67e80;
          orange: #e69875;
          yellow: #dbbc7f;
          green: #a7c080;
          cyan: #83c092;
          blue: #7fbbb3;
          purple: #d699b6;
          grey0: #7a8478;
          grey1: #859289;
          grey2: #9da9a0;

          background-color: transparent;
          text-color: @fg0;

          margin: 0;
          padding: 0;
          spacing: 0;
        }

        window {
          transparency: "real";
          background-color: @bg0;
          border: 2px solid;
          border-color: @bg3;
          border-radius: 12px;
          width: 650px;
          padding: 16px;
        }

        mainbox {
          background-color: transparent;
          spacing: 16px;
          children: [inputbar, listview];
        }

        inputbar {
          background-color: @bg1;
          text-color: @fg0;
          border-radius: 8px;
          padding: 12px 16px;
          spacing: 12px;
          children: [prompt, entry];
        }

        prompt {
          background-color: transparent;
          text-color: @green;
          font: "JetBrainsMono Nerd Font Bold 12";
        }

        entry {
          background-color: transparent;
          text-color: @fg0;
          placeholder-color: @grey1;
          placeholder: "Search...";
          cursor: text;
        }

        listview {
          background-color: transparent;
          columns: 1;
          lines: 8;
          spacing: 6px;
          cycle: true;
          dynamic: true;
          scrollbar: false;
        }

        element {
          background-color: transparent;
          text-color: @fg0;
          border-radius: 0px;
          padding: 10px 12px;
          spacing: 12px;
        }

        element normal.normal {
          background-color: transparent;
          text-color: @fg0;
        }

        element selected.normal {
          background-color: @bg2;
          text-color: @green;
          border: 0px 0px 0px 5px solid;
          border-color: @green;
        }

        element alternate.normal {
          background-color: transparent;
          text-color: @fg0;
        }

        element-icon {
          background-color: transparent;
          size: 28px;
          cursor: inherit;
        }

        element-text {
          background-color: transparent;
          text-color: inherit;
          cursor: inherit;
          vertical-align: 0.5;
        }

        message {
          background-color: @bg1;
          border-radius: 8px;
          padding: 12px;
        }

        textbox {
          background-color: transparent;
          text-color: @fg0;
          padding: 8px;
        }

        error-message {
          background-color: @bg0;
          border: 2px solid;
          border-color: @red;
          border-radius: 8px;
          padding: 12px;
        }
      ''
    );
  };
}
