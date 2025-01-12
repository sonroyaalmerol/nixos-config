# https://github.com/hyprwm/Hyprland
# TODO: Use HM to set up the hyprland config
{pkgs, inputs, ...}: {
  wayland.windowManager.hyprland = {
    enable = true;
    package = inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system}.hyprland;
    systemd.variables = ["--all"];
    xwayland.enable = true;
  };
  
  home.sessionVariables = {
    MOZ_ENABLE_WAYLAND = 1;
    QT_QPA_PLATFORM = "wayland;xcb";
    LIBSEAT_BACKEND = "logind";
    NIXOS_OZONE_WL = 1; 
  };

  home.file.".config/hypr" = {
    recursive = true;
    source = ./addons;
  };

  home.file.".local/share/icons" = {
    recursive = true;
    source = ./hyprcursor;
  };

  imports = [
    ./monitors.nix
    ./settings.nix
    ./hyprpaper.nix
    ./hypridle.nix
    ./hyprlock.nix
  ];

  wayland.windowManager.hyprland.catppuccin = {
    enable = true;
  };

  home.file.".config/hypr/scripts" = {
    recursive = true;
    source = ./scripts;
  };

  home.packages = with pkgs; [
    brightnessctl
    hypridle
    hyprlock
    hyprpaper
    grim
    libinput
    networkmanagerapplet
    pavucontrol
    pipewire
    slurp
    wl-clipboard
    wlogout
    xdg-desktop-portal-gtk
    xdg-desktop-portal-hyprland
  ];
}
