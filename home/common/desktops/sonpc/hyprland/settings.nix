{pkgs, inputs, lib, ... }: {
  wayland.windowManager.hyprland.settings = {
    "$mainMod" = "SUPER";
    "$subMod" = "SUPER_SHIFT";
    "$tetMod" = "SUPER_CTRL";

    # Environment variables
    env = [
      "XCURSOR_SIZE,20"
      "WLR_DRM_DEVICES,/dev/dri/card0:/dev/dri/card1"
    ];

    # Execute commands on startup
    exec-once = [
      "waybar"
      "hyprctl setcursor Bibata-Modern-Ice 24"
      "signal-desktop --start-in-tray"
      "vesktop"
    ];

    input = {
      kb_layout = "us";
      kb_variant = "";
      kb_model = "";
      kb_options = "";
      kb_rules = "";

      follow_mouse = 1;

      touchpad = {
        natural_scroll = false;
      };

      sensitivity = 0;
    };

    general = {
      gaps_in = 5;
      gaps_out = 5;
      border_size = 2;
      "col.active_border" = "$pink $mauve 90deg";
      "col.inactive_border" = "$mauve";
      layout = "dwindle";
    };

    decoration = {
      rounding = 10;
      active_opacity = 1.0;
      inactive_opacity = 0.95;
      dim_inactive = true;
      dim_strength = 0.1;

      blur = {
        enabled = true;
        size = 8;
        passes = 2;
        popups = true;
      };

      drop_shadow = true;
      shadow_range = 4;
      shadow_render_power = 3;
      "col.shadow" = "$base";
    };
    
    binds = {
      movefocus_cycles_fullscreen = true;
    };

    animations = {
      enabled = false;
      bezier = [ 
        "wind, 0.05, 0.9, 0.1, 1.05"
        "winIn, 0.1, 1.1, 0.1, 1.1"
        "winOut, 0.3, -0.3, 0, 1"
        "liner, 1, 1, 1, 1"
      ];
      animation = [ 
        "windows, 1, 6, wind, slide"
        "windowsIn, 1, 6, winIn, slide"
        "windowsOut, 1, 5, winOut, slide"
        "windowsMove, 1, 5, wind, slide"
        "border, 1, 1, liner"
        "borderangle, 1, 200, liner, loop"
        "fade, 1, 10, default"
        "workspaces, 1, 5, wind"
      ];
    };

    dwindle = {
      pseudotile = true;
      preserve_split = true;
      force_split = 2;
      default_split_ratio = 1.2;
    };

    master = {
      new_status = "master";
    };

    gestures = {
      workspace_swipe = false;
    };

    misc = {
      disable_hyprland_logo = true;
      mouse_move_enables_dpms = true;
      key_press_enables_dpms = true;
    };

    # Window rules
    windowrulev2 = [
      "idleinhibit fullscreen, class:^(*)$"
      "idleinhibit fullscreen, title:^(*)$"
      "idleinhibit fullscreen, fullscreen:1"
      "noborder,title:^(.*ulauncher.*)$"
      "noborder,title:^(.*Ulauncher.*)$"
      "noshadow,title:^(.*ulauncher.*)$"
      "noshadow,title:^(.*Ulauncher.*)$"
      "dimaround,title:^(.*ulauncher.*)$"
      "dimaround,title:^(.*Ulauncher.*)$"
    ];

    # Keybinds
    bind = [
      "$mainMod, return, exec, kitty"
      "$mainMod, Q, killactive,"
      "$subMod, E, exit,"
      "$subMod, R, exec, pkill waybar && waybar && hyprctl reload"
      "$mainMod, L, exec, hyprlock"
      "$mainMod, T, exec, nautilus"
      "$mainMod, V, togglefloating,"
      "$mainMod, D, exec, rofi -show drun -modi run,drun,ssh -scroll-method 0 -drun-match-fields all -drun-display-format \"{name}\" -no-drun-show-actions"
      "$subMod, S, exec, ~/.config/hypr/scripts/screenshot.sh region"
      "$subMod, P, exec, ~/.config/hypr/scripts/screenshot.sh activemonitor"
      "$subMod, W, exec, ~/.config/hypr/scripts/screenshot.sh activewindow"
      #"$mainMod, h, movefocus, l"
      #"$mainMod, l, movefocus, r"
      #"$mainMod, k, movefocus, u"
      #"$mainMod, j, movefocus, d"
      "$mainMod, mouse_down, workspace, e+1"
      "$mainMod, mouse_up, workspace, e-1"
      #"$mainMod, t, layoutmsg, togglesplit"
      #"$mainMod, s, layoutmsg, swapsplit"
      "$mainMod, w, swapnext"
      "$mainMod, m, fullscreen, 1"
      "$subMod, m, fullscreen, 0"
      "$mainMod, f, togglefloating"
      "$mainMod, 0, workspace, 10"
      "$subMod, 0, movetoworkspace, 10"
    ]
    ++ (
      # Workspace bindings
      builtins.concatLists (builtins.genList (i:
        let ws = i + 1;
        in [
          "$mainMod, ${toString (i + 1)}, workspace, ${toString ws}"
          "$subMod, ${toString (i + 1)}, movetoworkspace, ${toString ws}"
        ]
      ) 9)
    );
    
    bindm = [
      "$mainMod, mouse:272, movewindow"
      "$mainMod, mouse:273, resizewindow"
    ];

    # Workspace to monitor assignment
    workspace = [
      "1, monitor:DP-2"
      "2, monitor:DP-2"
      "3, monitor:DP-2"
      "4, monitor:DP-2"
      "5, monitor:DP-2"
      "6, monitor:HDMI-A-1"
      "7, monitor:HDMI-A-1"
      "8, monitor:HDMI-A-1"
      "9, monitor:HDMI-A-1"
      "10, monitor:HDMI-A-1"
    ];
  };

  wayland.windowManager.hyprland.systemd.variables = [
    "WAYLAND_DISPLAY"
    "XDG_CURRENT_DESKTOP"
  ];
}
