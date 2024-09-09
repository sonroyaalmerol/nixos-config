{pkgs, ...}: {
  services.printing.enable = true;
  services.printing.drivers = with pkgs; [
    samsung-unified-linux-driver
  ];
  services.avahi = {
    enable = true;
    nssmdns4 = true;
    openFirewall = true;
  };
}
