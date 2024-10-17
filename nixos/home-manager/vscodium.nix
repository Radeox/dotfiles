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
    ];

    userSettings = {
      "editor.fontSize" = 14;
      "editor.fontWeight" = 600;
      "editor.fontFamily" = "'Jetbrains Mono', 'JetBrainsMono Nerd Font', 'Droid Sans Mono', monospace";
      "editor.semanticHighlighting.enabled" = true;
      "editor.smoothScrolling" = false;
      "editor.fontLigatures" = true;
      "editor.letterSpacing" = 0.4;

      "terminal.integrated.fontSize" = 14;
      "terminal.integrated.fontFamily" = "'JetBrainsMono Nerd Font', 'Droid Sans Mono', monospace";
      "terminal.integrated.minimumContrastRatio" = 1;

      "workbench.startupEditor" = "none";
      "workbench.colorTheme" = "Catppuccin Mocha";
      "workbench.iconTheme" = "catppuccin-mocha";

      "window.zoomLevel" = 1;
      "window.menuBarVisibility" = "toggle";
      "window.restoreFullscreen" = true;
      "window.titleBarStyle" = "custom";

      "zenMode.centerLayout" = false;
      "redhat.telemetry.enabled" = false;
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
      jnoortheen.nix-ide
      mongodb.mongodb-vscode
      monosans.djlint
      ms-python.black-formatter
      ms-python.isort
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
