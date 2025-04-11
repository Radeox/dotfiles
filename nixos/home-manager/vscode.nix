{ pkgs, unstable, ... }: {
  programs.vscode = {
    enable = true;
    mutableExtensionsDir = false;
    enableUpdateCheck = false;
    enableExtensionUpdateCheck = false;

    # Use the latest version of VSCode
    package = unstable.vscode;

    # Configure keybindings
    keybindings = [
      {
        key = "ctrl+space";
        command = "workbench.action.quickOpen";
      }
      {
        key = "ctrl+n";
        command = "workbench.action.toggleSidebarVisibility";
      }
      {
        key = "ctrl+shift+space";
        command = "workbench.action.showCommands";
      }
      {
        key = "ctrl+shift+r";
        command = "workbench.view.search";
      }
      {
        key = "f1";
        command = "workbench.action.terminal.toggleTerminal";
      }
      {
        key = "f4";
        command = "workbench.action.toggleZenMode";
      }
      {
        key = "f5";
        command = "workbench.action.splitEditorRight";
      }
      {
        key = "f6";
        command = "workbench.action.splitEditorDown";
      }
      {
        key = "ctrl+shift+q";
        command = "workbench.action.quit";
      }
      {
        key = "ctrl+q";
        command = "workbench.action.closeActiveEditor";
      }
    ];

    userSettings = {
      # Editor style
      "editor.fontSize" = 14;
      "editor.fontWeight" = 600;
      "editor.fontFamily" = "'Jetbrains Mono', 'JetBrainsMono Nerd Font', 'Droid Sans Mono', monospace";
      "editor.semanticHighlighting.enabled" = true;
      "editor.smoothScrolling" = false;
      "editor.fontLigatures" = true;
      "editor.letterSpacing" = 0.4;

      # Formatting config
      "editor.formatOnPaste" = true;
      "editor.formatOnSave" = true;

      # Terminal
      "terminal.integrated.fontSize" = 14;
      "terminal.integrated.fontFamily" = "'JetBrainsMono Nerd Font', 'Droid Sans Mono', monospace";
      "terminal.integrated.minimumContrastRatio" = 1;
      "terminal.integrated.copyOnSelection" = true;

      # Theme
      "workbench.startupEditor" = "none";
      "workbench.colorTheme" = "Ayu Dark";
      "workbench.iconTheme" = "catppuccin-mocha";

      # Window style
      "window.zoomLevel" = 1;
      "window.menuBarVisibility" = "toggle";
      "window.restoreFullscreen" = true;
      "window.titleBarStyle" = "custom";

      # Git
      "git.autofetch" = true;
      "git.confirmSync" = false;

      # Zen
      "zenMode.centerLayout" = false;
      "zenMode.hideLineNumbers" = false;
      "zenMode.hideStatusBar" = false;

      # Vim
      "vim.useSystemClipboard" = true;

      # Copilot
      "github.copilot.nextEditSuggestions.enabled" = true;

      # Extra
      "editor.inlineSuggest.suppressSuggestions" = true;
      "extensions.ignoreRecommendations" = true;
      "hediet.vscode-drawio.resizeImages" = null;
      "postman.settings.dotenv-detection-notification-visibility" = false;
      "redhat.telemetry.enabled" = false;

      # Python config
      "isort.args" = [ "--profile" "black" ];
      "[python]" = {
        "editor.defaultFormatter" = "ms-python.black-formatter";
        "editor.formatOnSave" = true;
        "editor.codeActionsOnSave" = {
          "source.organizeImports" = "explicit";
        };
      };

      # Javascript config
      "[javascript]" = {
        "editor.defaultFormatter" = "esbenp.prettier-vscode";
      };

      # SCSS config
      "[scss]" = {
        "editor.defaultFormatter" = "esbenp.prettier-vscode";
      };

      # Extensions
      "projectManager.git.baseFolders" = [
        "/home/radeox/Sources"
      ];
    };

    # Configure extensions
    extensions = with pkgs.open-vsx; [
      aaron-bond.better-comments
      alefragnani.bookmarks
      alefragnani.project-manager
      batisteo.vscode-django
      bmewburn.vscode-intelephense-client
      catppuccin.catppuccin-vsc-icons
      dart-code.dart-code
      dart-code.flutter
      eamodio.gitlens
      esbenp.prettier-vscode
      hediet.vscode-drawio
      jnoortheen.nix-ide
      monosans.djlint
      ms-python.black-formatter
      ms-python.isort
      ms-python.python
      naumovs.color-highlight
      redhat.vscode-xml
      redhat.vscode-yaml
      teabyii.ayu
      vscodevim.vim
      xdebug.php-debug
      yzhang.markdown-all-in-one
    ] ++ (with pkgs.vscode-marketplace-release; [
      github.copilot
      github.copilot-chat
    ]);
  };
}
