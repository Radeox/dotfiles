{ pkgs-unstable, ... }: {
  programs.zed-editor = {
    enable = true;
    package = pkgs-unstable.zed-editor-fhs;

    userSettings = {
      # Vim 4ever
      vim_mode = true;

      # Ollama integration
      assistant = {
        version = "2";

        default_model = {
          provider = "ollama";
          model = "llama3.1:8b";
        };
      };

      features = {
        copilot = true;
      };

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
          languages_servers = [ "pylsp" "ruff" ];
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
        "php"
        "python-lsp"
        "ruff"
        "scss"
      ];
    };

    # Keymaps
    userKeymaps = [
      {
        context = "Workspace";
        bindings = {
          ctrl-space = "file_finder::Toggle";
          ctrl-shift-r = "pane::DeploySearch";
          ctrl-b = "project_panel::ToggleFocus";
          ctrl-g = "git_panel::ToggleFocus";
          ctrl-q = "pane::CloseActiveItem";
        };
      }

      {
        context = "Editor";
        bindings = {
          ctrl-space = "file_finder::Toggle";
          ctrl-shift-r = "pane::DeploySearch";
          ctrl-b = "project_panel::ToggleFocus";
          ctrl-g = "git_panel::ToggleFocus";
          ctrl-q = "pane::CloseActiveItem";
        };
      }
    ];
  };
}
