{ pkgs, ... }:
{
  programs.vscode = {
    enable = true;
    package = pkgs.vscodium;

    # Disable auto-update
    enableUpdateCheck = false;
    enableExtensionUpdateCheck = false;
    mutableExtensionsDir = false;

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
        command = "workbench.action.toggleZenMode";
      }
      {
        key = "f2";
        command = "workbench.action.terminal.toggleTerminal";
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
      "workbench.colorTheme" = "Catppuccin Mocha";
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

      # Extra
      "redhat.telemetry.enabled" = false;

      # Editor config
      "[javascript]" = {
        "editor.defaultFormatter" = "esbenp.prettier-vscode";
      };

      "[scss]" = {
        "editor.defaultFormatter" = "esbenp.prettier-vscode";
      };

      # Extensions
      "projectManager.git.baseFolders" = [
        "/home/radeox/Sources"
      ];

      "hediet.vscode-drawio.resizeImages" = null;
    };

    # Configure extensions
    extensions = with pkgs.open-vsx; [
      aaron-bond.better-comments
      alefragnani.bookmarks
      alefragnani.project-manager
      batisteo.vscode-django
      bmewburn.vscode-intelephense-client
      catppuccin.catppuccin-vsc-icons
      dreamcatcher45.podmanager
      eamodio.gitlens
      esbenp.prettier-vscode
      hediet.vscode-drawio
      jnoortheen.nix-ide
      mongodb.mongodb-vscode
      monosans.djlint
      ms-python.black-formatter
      ms-python.isort
      ms-python.python
      naumovs.color-highlight
      postman.postman-for-vscode
      redhat.vscode-xml
      redhat.vscode-yaml
      ritwickdey.liveserver
      tabbyml.vscode-tabby
      vscodevim.vim
      xdebug.php-debug
      yzhang.markdown-all-in-one

      (pkgs.catppuccin-vsc.override {
        accent = "teal";
        boldKeywords = true;
        italicComments = false;
        italicKeywords = false;
        extraBordersEnabled = false;
        workbenchMode = "default";
        bracketMode = "rainbow";
        colorOverrides = { };
        customUIColors = { };
      })
    ];
  };
}
