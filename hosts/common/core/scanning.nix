{pkgs, ...}: {
  hardware.sane.enable = true;
  hardware.sane.openFirewall = true;
  hardware.sane.netConf = "192.168.11.104"; 
  hardware.sane.extraBackends = with pkgs; [
    sane-airscan
  ];
}
