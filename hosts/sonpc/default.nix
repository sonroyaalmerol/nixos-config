{
  pkgs,
  outputs,
  inputs,
  ...
}: {
  imports =
    [
      # Hardware config
      inputs.hardware.nixosModules.common-cpu-amd
      inputs.hardware.nixosModules.common-gpu-amd
      ./hardware-configuration.nix

      # Common config
      ../common/core

      # Optional config
      ../common/optional/hyprland.nix
      ../common/optional/steam.nix

      # User config
      ../common/users/sonroyaalmerol
    ]
    ++ (builtins.attrValues outputs.nixosModules);

  # Bootloader.
  boot.kernelPackages = pkgs.linuxPackages_latest;
  boot.loader.grub.efiSupport = true;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.loader.efi.efiSysMountPoint = "/boot";
  boot.loader.systemd-boot.enable = true;
  boot.loader.grub.useOSProber = true;
  boot.loader.grub.configurationLimit = 15;
  boot.loader.systemd-boot.configurationLimit = 15;
  boot.supportedFilesystems = ["ntfs"];

  # amd gpu support for kernel
  boot.initrd.kernelModules = ["amdgpu"];

  boot.kernelParams = [
    "video=DP-2:1920x1080@144"
    "video=HDMI-A-1:1680x1050@60"
  ];

  networking.hostName = "sonpc"; # Define your hostname.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  hardware.graphics = {
    enable = true;
    enable32Bit = true;
    extraPackages = with pkgs; [
      rocmPackages.clr
      rocmPackages.clr.icd
      amdvlk
    ];
    extraPackages32 = with pkgs; [
      driversi686Linux.amdvlk
    ];
  };

  environment.variables = {
    ROC_ENABLE_PRE_VEGA = "1";
    VK_ICD_FILENAMES = "/run/opengl-driver/share/vulkan/icd.d/radeon_icd.x86_64.json";
  };

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
