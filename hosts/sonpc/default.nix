{
  pkgs,
  outputs,
  inputs,
  lib,
  ...
}: {
  imports =
    [
      # Hardware config
      inputs.hardware.nixosModules.common-cpu-amd
      inputs.hardware.nixosModules.common-gpu-amd
      ./hardware-configuration.nix

      # Secure boot
      inputs.lanzaboote.nixosModules.lanzaboote

      # Common config
      ../common/core

      # Optional config
      ../common/optional/hyprland.nix
      ../common/optional/steam.nix
      ../common/optional/nixos-upgrades.nix
      ../common/optional/udev.nix

      # User config
      ../common/users/sonroyaalmerol
    ]
    ++ (builtins.attrValues outputs.nixosModules);

  # Bootloader.
  boot.kernelPackages = pkgs.linuxPackages_latest;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.loader.efi.efiSysMountPoint = "/boot";

  boot.loader.grub.devices = ["nodev"];
  boot.loader.grub.efiSupport = true;
  boot.loader.grub.useOSProber = true;
  boot.loader.grub.configurationLimit = 15;
  
  boot.loader.systemd-boot.enable = lib.mkForce false;
  boot.lanzaboote = {
    enable = true;
    pkiBundle = "/etc/secureboot";
  };

  boot.plymouth = {
    enable = true;
    theme = "rings";
    themePackages = with pkgs; [
      # By default we would install all themes
      (adi1090x-plymouth-themes.override {
        selected_themes = [ "rings" ];
      })
    ];
  };

  boot.consoleLogLevel = 0;
  boot.initrd.verbose = false;

  boot.supportedFilesystems = ["ntfs"];

  # amd gpu support for kernel
  boot.initrd.kernelModules = ["amdgpu"];

  boot.kernelParams = [
    "quiet"
    "splash"
    "boot.shell_on_fail"
    "loglevel=3"
    "rd.systemd.show_status=false"
    "rd.udev.log_level=3"
    "udev.log_priority=3"
    "video=DP-1:2560x1440@180"
    "video=DP-2:1920x1080@144"
  ];

  networking.hostName = "sonpc"; # Define your hostname.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  # Load amd driver for Xorg and Wayland
  services.xserver.videoDrivers = ["amdgpu"];

  hardware.bluetooth.enable = true;

  console.useXkbConfig = true;

  # Configure keymap in X11
  services.xserver = {
    enable = true;
    xkb.options = "ctrl:nocaps";
    xkb.layout = "us";
    xkb.variant = "";
    displayManager.gdm.enable = true;
  };

  system.stateVersion = "24.05";
}
