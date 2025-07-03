{ pkgs, ... }: {
  programs.zed-editor = {
    enable = true;
    package = pkgs.zed-editor-fhs;

    userSettings = {
      # AI agent configuration
      agent = {
        default_profile = "write";
        always_allow_tool_actions = true;
        version = "2";

        default_model = {
          model = "gpt-4.1";
          provider = "copilot_chat";
        };

        profiles = {
          write = {
            name = "Write";
            tools = {
              copy_path = true;
              create_directory = true;
              create_file = true;
              delete_path = true;
              diagnostics = true;
              edit_file = true;
              fetch = true;
              list_directory = true;
              move_path = true;
              now = true;
              find_path = true;
              read_file = true;
              grep = true;
              terminal = true;
              thinking = true;
              web_search = true;
              open = true;
            };
            enable_all_context_servers = true;
            context_servers = { };
          };
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

      # Add line length and wrap guides
      show_wrap_guides = true;
      wrap_guides = [ 120 ];
      preferred_line_length = 120;

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
