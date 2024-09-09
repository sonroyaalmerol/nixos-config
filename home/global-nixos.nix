{config, ...}: {
  imports = [
    ./common/core
    ./common/optional/apps/linux-only.nix
    ./common/optional/apps/kitty.nix
    ./common/optional/apps/rofi
    # NOTE: espanso disabled because it's not working on wayland
    # ./common/optional/misc/espanso.nix
    # NOTE: gammastep disabled because of flickering issue
    # ./common/optional/misc/gammastep.nix
  ];

  home = {
    username = "sonroyaalmerol";
    homeDirectory = "/home/${config.home.username}";
    stateVersion = "24.05";
  };
}
