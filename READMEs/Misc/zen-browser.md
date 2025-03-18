# Zen Browser - Notes #

## Make default browser - flatpak version ##

```bash
xdg-settings set default-web-browser app.zen_browser.zen.desktop
```

## Desktop entry ##

`app.zen_browser.zen.desktop`:

```
[Desktop Entry]
Name=Zen Browser
Exec=/run/current-system/sw/bin/flatpak run --file-forwarding app.zen_browser.zen @@u %u @@
Icon=/home/radeox/.local/share/applications/zen_browser.svg
StartupWMClass=zen
Type=Application
MimeType=text/html;text/xml;application/xhtml+xml;x-scheme-handler/http;x-scheme-handler/https;application/x-xpinstall;application/pdf;application/json;
Categories=Network;WebBrowser;
Terminal=false
Keywords=Internet;WWW;Browser;Web;Explorer;
Actions=new-window;new-private-window;profilemanager;
X-Flatpak=app.zen_browser.zen

[Desktop Action new-window]
Name=Open a New Window
Exec=/usr/bin/flatpak run --file-forwarding app.zen_browser.zen @@u %u @@

[Desktop Action new-private-window]
Name=Open a New Private Window
Exec=/usr/bin/flatpak run --file-forwarding app.zen_browser.zen --private-window @@u %u @@
```
