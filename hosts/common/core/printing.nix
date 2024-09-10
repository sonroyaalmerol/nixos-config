{pkgs, ...}: {
  services.printing.enable = true;
  services.printing.browsing = true;
  services.printing.browsedConf = ''
  BrowseDNSSDSubTypes _cups,_print
  BrowseLocalProtocols all
  BrowseRemoteProtocols all
  CreateIPPPrinterQueues All

  BrowseProtocols all
  '';
  services.printing.drivers = with pkgs; [
    samsung-unified-linux-driver_1_00_37
    samsung-unified-linux-driver
  ];
  services.avahi = {
    enable = true;
    nssmdns4 = true;
    openFirewall = true;
  };
}
