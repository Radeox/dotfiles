{ pkgs, ... }: {
  programs.zed-editor = {
    enable = true;
    package = pkgs.zed-editor-fhs;

    userSettings = {
      # Ollama
      agent = {
        default_model = {
          model = "claude-sonnet-4";
          provider = "copilot_chat";
        };
      };

      # Prediction configuration
      features = {
        edit_prediction_provider = "copilot";
      };

      # Vim 4ever
      vim_mode = true;

      # Theme configuration
      theme = {
        mode = "dark";
        light = "One Light";
        dark = "Ayu Dark";
      };

      icon_theme = {
        mode = "dark";
        light = "Catppuccin Latte";
        dark = "Catppuccin Mocha";
      };

      # Disable telemetry
      telemetry = {
        diagnostics = false;
        metrics = false;
      };

      # Customize UI
      buffer_font_size = 16;
      buffer_font_family = "JetBrainsMono Nerd Font";

      # LSP configuration
      languages = {
        Python = {
          format_on_save = "on";

          formatter = [
            {
              language_server = {
                name = "ruff";
              };
            }

            {
              code_actions = {
                # Fix all auto-fixable lint violations
                "source.fixAll.ruff" = true;

                # Organize imports
                "source.organizeImports.ruff" = true;
              };
            }
          ];
        };
      };

      # Extensions
      extensions = [
        "catppuccin-icons"
        "dart"
        "deno"
        "docker-compose"
        "dockerfile"
        "graphql"
        "html"
        "make"
        "mcp-server-puppeteer"
        "mcp-server-sequential-thinking"
        "php"
        "python-lsp"
        "ruff"
        "scss"
        "toml"
      ];
    };

    # Keymaps
    userKeymaps = [
      {
        bindings = {
          ctrl-space = "file_finder::Toggle";
          ctrl-shift-r = "pane::DeploySearch";
          ctrl-b = "project_panel::ToggleFocus";
          ctrl-g = "git_panel::ToggleFocus";
          ctrl-q = [ "pane::CloseActiveItem" { "close_pinned" = false; } ];
        };
      }
    ];
  };
}
