{
  inputs,
  lib,
  ...
}: {
  imports = [
    inputs.home-manager.nixosModules.home-manager
    ./docker.nix
    ./fonts.nix
    ./gnupg.nix
    ./gvfs.nix
    ./greetd.nix
    ./locale.nix
    ./networking.nix
    ./nix.nix
    ./pipewire.nix
    ./printing.nix
    ./scanning.nix
    ./services.nix
    ./zsh.nix
  ];

  hardware.enableRedistributableFirmware = true;
  systemd.services.NetworkManager-wait-online.enable = lib.mkForce false;

}
