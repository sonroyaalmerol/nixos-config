{inputs, ...}: {
  imports = [
    ./global-nixos.nix
    ./common/desktops/sonpc/waybar
    ./common/desktops/sonpc/services/mako

    inputs.catppuccin.homeManagerModules.catppuccin
    ./common/desktops/sonpc/gtk.nix
    ./common/desktops/sonpc/qt5.nix
    ./common/desktops/sonpc/xdg.nix
    ./common/desktops/sonpc/hyprland
  ];
}
