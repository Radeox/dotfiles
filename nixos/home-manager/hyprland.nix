{ ... }:
{
  wayland.windowManager.hyprland = {
    # Enable Home-manager module
    enable = true;

    extraConfig = ''
      # Keybindings
      bind = Super, T, exec, alacritty
      bind = Super, B, exec, firefox
      bind = Super, F, exec, thunar
      bind = Super, N, exec, spotify
      bind = Super, L, exec, pidof hyprlock || hyprlock
      bind = Super, J, exec, pkill telegram-desktop || telegram-desktop
      bind = Super, M, exec, pkill thunderbird || thunderbird
      bind = Super, Space, exec, pkill tofi || tofi-drun --drun-launch=true
      bind = Super, V, exec, cliphist list | tofi --horizontal false --height 50% --width 50% --anchor center | cliphist decode | wl-copy

      # System management
      bind = Super+Shift, A, exec, [floating] pavucontrol
      bind = Super+Shift, B, exec, [floating] blueman-manager

      # Window management
      bind = Super, Q, killactive, 
      bind = Super, HOME, fullscreen
      bind = Super, END, togglefloating, 
      bind = Super, PAGE_UP, togglesplit
      bind = Super, F1, exit, 
      bind = Super SHIFT, S, exec, grimblast copy area

      # Lid switch - suspend
      bindl = ,switch:317ff70, exec, systemctl suspend

      # Change focused window
      bind = Super, left, movefocus, l
      bind = Super, right, movefocus, r
      bind = Super, up, movefocus, u
      bind = Super, down, movefocus, d

      # Swap focused window
      bind = Super+Shift, left, movewindow, l
      bind = Super+Shift, right, movewindow, r
      bind = Super+Shift, up, movewindow, u
      bind = Super+Shift, down, movewindow, d

      # Switch workspaces
      bind = Super, 1, workspace, 1
      bind = Super, 2, workspace, 2
      bind = Super, 3, workspace, 3
      bind = Super, 4, workspace, 4
      bind = Super, 5, workspace, 5
      bind = Super, 6, workspace, 6
      bind = Super, 7, workspace, 7
      bind = Super, 8, workspace, 8
      bind = Super, 9, workspace, 9
      bind = Super, 0, workspace, 10

      # Move active window to workspace
      bind = Super SHIFT, 1, movetoworkspace, 1
      bind = Super SHIFT, 2, movetoworkspace, 2
      bind = Super SHIFT, 3, movetoworkspace, 3
      bind = Super SHIFT, 4, movetoworkspace, 4
      bind = Super SHIFT, 5, movetoworkspace, 5
      bind = Super SHIFT, 6, movetoworkspace, 6
      bind = Super SHIFT, 7, movetoworkspace, 7
      bind = Super SHIFT, 8, movetoworkspace, 8
      bind = Super SHIFT, 9, movetoworkspace, 9
      bind = Super SHIFT, 0, movetoworkspace, 10

      # Move/resize windows
      bindm = Super, mouse:272, movewindow
      bindm = Super, mouse:273, resizewindow

      # Volume control
      bindl = ,XF86AudioMute, exec, wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle
      bindle=, XF86AudioRaiseVolume, exec, wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+
      bindle=, XF86AudioLowerVolume, exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-

      # Media control
      bindl = ,XF86AudioPlay, exec, playerctl play-pause
      bindl = ,XF86AudioNext, exec, playerctl next
      bindl = ,XF86AudioPrev, exec, playerctl previous
      bindl = ,XF86AudioStop, exec, playerctl stop

      # Brightness control
      bindle = ,XF86MonBrightnessDown, exec, brightnessctl s 10%-
      bindle = ,XF86MonBrightnessUp, exec, brightnessctl s +10%

      # Resize mode
      # Start resize mode with SUPER + R
      bind=Super, R, submap, resize
      submap=resize

      # Resize mode keybindings
      binde=,right,resizeactive,50 0
      binde=,left,resizeactive,-50 0
      binde=,up,resizeactive,0 -50
      binde=,down,resizeactive,0 50

      # Exit resize mode
      bind=,escape,submap,reset 
      submap=reset

      # Monitor configuration
      monitor=HDMI-A-1,preferred,auto,1
      monitor=DP-2,preferred,auto,1
      monitor=eDP-1,2560x1600@165,auto,1.6,vrr,1

      # Autostart apps
      exec-once = swww-daemon
      exec-once = kanshi
      exec-once = wl-paste --type text --watch cliphist store

      # some default env vars.
      env = XCURSOR_SIZE,24
      env = QT_QPA_PLATFORMTHEME,qt6ct # change to qt6ct if you have that

      # Window rules
      windowrulev2 = suppressevent maximize, class:.*

      # For all categories, see https://wiki.hyprland.org/Configuring/Variables/
      input {
          kb_layout = us,it
          kb_variant =
          kb_model =
          kb_options = grp:alt_space_toggle
          kb_rules =

          follow_mouse = 1

          touchpad {
              natural_scroll = no
          }

          sensitivity = 0 # -1.0 to 1.0, 0 means no modification.
      }

      general {
          # See https://wiki.hyprland.org/Configuring/Variables/ for more

          gaps_in = 5
          gaps_out = 20
          border_size = 2
          col.active_border = $lavender $mauve 45deg
          col.inactive_border = $surface1
          layout = dwindle
          allow_tearing = false
      }

      decoration {
          blur {
              enabled = true
              size = 3
              passes = 1
          }

          rounding = 12
          drop_shadow = yes
          shadow_range = 4
          shadow_render_power = 3
          col.shadow = $surface0
      }

      animations {
          enabled = yes

          bezier = myBezier, 0.05, 0.9, 0.1, 1.05
          animation = windows, 1, 7, myBezier
          animation = windowsOut, 1, 7, default, popin 80%
          animation = border, 1, 10, default
          animation = borderangle, 1, 8, default
          animation = fade, 1, 7, default
          animation = workspaces, 1, 6, default
      }

      dwindle {
          pseudotile = yes
          preserve_split = yes
          force_split = 2
      }

      gestures {
          workspace_swipe = on
      }

      misc {
          force_default_wallpaper = 0
      }
    '';
  };
}
