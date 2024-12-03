{ pkgs, ... }:
{
  nix.settings = {
    substituters = ["https://hyprland.cachix.org"];
    trusted-public-keys = ["hyprland.cachix.org-1:a7pgxzMz7+chwVL3/pzj6jIBMioiJM7ypFP8PwtkuGc="];
  };

  programs.hyprland = {
    enable = true;
  };

  environment.systemPackages = with pkgs; [ 
    xdg-desktop-portal-gtk
    xdg-desktop-portal-hyprland
  ];

  environment.sessionVariables.NIXOS_OZONE_WL = "1";
}
