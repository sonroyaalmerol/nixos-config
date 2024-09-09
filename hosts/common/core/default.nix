{
  inputs,
  ...
}: {
  imports = [
    inputs.home-manager.nixosModules.home-manager
    ./docker.nix
    ./fonts.nix
    ./gnupg.nix
    ./gvfs.nix
    ./locale.nix
    ./networking.nix
    ./nix.nix
    ./pipewire.nix
    ./printing.nix
    ./services.nix
    ./zsh.nix
  ];

  hardware.enableRedistributableFirmware = true;
}
