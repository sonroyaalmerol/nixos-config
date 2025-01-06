{
  pkgs,
  config,
  ...
}: let
  ifTheyExist = groups: builtins.filter (group: builtins.hasAttr group config.users.groups) groups;
in {
  imports = [
  ];
  users.users.sonroyaalmerol = {
    isNormalUser = true;
    description = "Son Roy Almerol";
    shell = pkgs.zsh;
    extraGroups = ["networkmanager" "wheel" "docker" "podman" "video" "dialout"] ++ ifTheyExist ["libvirtd" "mysql" "network" "git" "scanner" "lp"];
    packages = [pkgs.home-manager];
  };

  # Import this user's personal/home configurations
  home-manager.users.sonroyaalmerol = import ../../../../home/${config.networking.hostName}.nix;
}
