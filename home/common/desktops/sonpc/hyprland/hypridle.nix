{
  services.hypridle = {
    enable = true;
    settings = {
      general = {
        lock_cmd = "pidof hyprlock || hyprlock";       # avoid starting multiple hyprlock instances.
        before_sleep_cmd = "loginctl lock-session";    # lock before suspend.
        #after_sleep_cmd = "hyprctl dispatch dpms on; pkill -f 'hyprctl dispatch dpms off'"; # Stop dpms off loop on resume
        after_sleep_cmd = "hyprctl dispatch dpms on";
      };

      listener = [
        {
          timeout = 110;
          #on-timeout = "while true; do hyprctl dispatch dpms off; sleep 1; done &";  # Dispatch dpms off every 5 seconds indefinitely (in background)
          #on-resume = "pkill -f 'hyprctl dispatch dpms off'; hyprctl --instance 0 'keyword misc:allow_session_lock_restore 1'; pidof hyprlock || hyprctl --instance 0 'dispatch exec hyprlock'";                        # Kill the loop on resume
          on-timeout = "hyprctl dispatch dpms off";
        }
        {
          timeout = 120;
          on-timeout = "loginctl lock-session";
        }
        {
          timeout = 10;
          #on-timeout = "while pidof hyprlock; do hyprctl dispatch dpms off; sleep 1; done &";  # Dispatch dpms off every 5 seconds if hyprlock is running (in background)
          #on-resume = "pkill -f 'hyprctl dispatch dpms off'; hyprctl --instance 0 'keyword misc:allow_session_lock_restore 1'; pidof hyprlock || hyprctl --instance 0 'dispatch exec hyprlock'";                        # Kill the loop on resume
          on-timeout = "pidof hyprlock >/dev/null && hyprctl dispatch dpms off";
        }
      ];
    };
  };
}
