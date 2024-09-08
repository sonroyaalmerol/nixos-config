{
  pkgs,
  lib,
  ...
}: {
  environment.systemPackages = [pkgs.alsa-utils];

  # ALSA provides a udev rule for restoring volume settings.
  services.udev.packages = [pkgs.alsa-utils];

  systemd.services.alsa-store = {
    description = "Store Sound Card State";
    wantedBy = ["multi-user.target"];
    unitConfig.RequiresMountsFor = "/var/lib/alsa";
    unitConfig.ConditionVirtualization = "!systemd-nspawn";
    serviceConfig = {
      Type = "oneshot";
      RemainAfterExit = true;
      ExecStart = lib.mkForce "${pkgs.coreutils}/bin/mkdir -p /var/lib/alsa";
      ExecStop = "${pkgs.alsa-utils}/sbin/alsactl store --ignore";
    };
  };

  security.rtkit.enable = true;

  services.pipewire = {
    enable = true;
    audio.enable = true;
    jack.enable = true;
    pulse.enable = true;
    alsa = {
      enable = true;
      support32Bit = true;
    };
  };
}
