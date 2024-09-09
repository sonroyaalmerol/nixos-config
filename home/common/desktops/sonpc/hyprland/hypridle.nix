{
  services.hypridle = {
    enable = true;
    settings = {
      general = {
        lock_cmd = "pidof hyprlock || hyprlock";       # avoid starting multiple hyprlock instances.
        before_sleep_cmd = "loginctl lock-session";    # lock before suspend.
        after_sleep_cmd = "hyprctl dispatch dpms on";  # to avoid having to press a key twice to turn on the display.
      };

      listener = [
        {
          timeout = 1;
          on-timeout = "pidof hyprlock || (bn=$(brightnessctl g) && [ \"$bn\" != \"$(cat /tmp/bn)\" ] && echo $bn > /tmp/bn)";
          on-resume = "pidof hyprlock || (brightnessctl set $(cat /tmp/bn) && hyprctl dispatch dpms on)";
        }
        {
          timeout = 280;
          on-timeout = "pidof hyprlock || brightnessctl -s set 5";
        }
        {
          timeout = 290;
          on-timeout = "pidof hyprlock || hyprctl dispatch dpms off";
        }
        {
          timeout = 300;
          on-timeout = "loginctl lock-session";
        }
        {
          timeout = 1;
          on-resume = "pidof hyprlock && (pid=$(pgrep -o hyprlock) && [ \"$(ps -p $pid -o etimes= | tr -d ' ')\" -gt 1 ] && brightnessctl set $(cat /tmp/bn) && hyprctl dispatch dpms on)";
        }
        {
          timeout = 5;
          on-timeout = "pidof hyprlock && brightnessctl -s set 5";
        }
        {
          timeout = 10;
          on-timeout = "pidof hyprlock && hyprctl dispatch dpms off";
        }
      ];
    };
  };
}
