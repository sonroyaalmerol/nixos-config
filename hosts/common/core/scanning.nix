{pkgs, ...}: {
  hardware.sane.enable = true;
  hardware.sane.openFirewall = true;
  hardware.sane.extraBackends = with pkgs; [
    sane-airscan
  ];
}
