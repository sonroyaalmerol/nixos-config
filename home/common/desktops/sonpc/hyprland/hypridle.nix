{
  services.hypridle = {
    enable = true;
    settings = {
      general = {
        lock_cmd = "pidof hyprlock || hyprlock";       # avoid starting multiple hyprlock instances.
        before_sleep_cmd = "loginctl lock-session";    # lock before suspend.
        after_sleep_cmd = "hyprctl dispatch dpms on";  # to avoid having to press a key twice to turn on the display.
        ignore_systemd_inhibit = true;
      };

      listener = [
        {
          timeout = 290;
          on-timeout = "pidof hyprlock || (sleep 5; hyprctl dispatch dpms off)";
        }
        {
          timeout = 300;
          on-timeout = "loginctl lock-session";
        }
        {
          timeout = 10;
          on-timeout = "pidof hyprlock && (sleep 5; hyprctl dispatch dpms off)";
        }
      ];
    };
  };
}
