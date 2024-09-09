{
  services.hypridle = {
    enable = true;
    settings = {
      general = {
        lock_cmd = "pidof hyprlock || hyprlock";       # avoid starting multiple hyprlock instances.
        before_sleep_cmd = "loginctl lock-session";    # lock before suspend.
        after_sleep_cmd = "hyprctl dispatch dpms on; pkill -f 'hyprctl dispatch dpms off'"; # Stop dpms off loop on resume
      };

      listener = [
        {
          timeout = 290;
          on-timeout = "while true; do hyprctl dispatch dpms off; done &";  # Dispatch dpms off every 5 seconds indefinitely (in background)
          on-resume = "pkill -f 'hyprctl dispatch dpms off'";                        # Kill the loop on resume
        }
        {
          timeout = 300;
          on-timeout = "loginctl lock-session";
        }
        {
          timeout = 10;
          on-timeout = "while pidof hyprlock; do hyprctl dispatch dpms off; done &";  # Dispatch dpms off every 5 seconds if hyprlock is running (in background)
          on-resume = "pkill -f 'hyprctl dispatch dpms off'";                                  # Kill the loop on resume
        }
      ];
    };
  };
}
