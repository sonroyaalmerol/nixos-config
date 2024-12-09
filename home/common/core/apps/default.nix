{pkgs, ...}: {
  imports = [
    ./brave.nix
  ];

  home.packages = with pkgs; [
    discord-canary
    parsec-bin
  ];
}
