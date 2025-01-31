{pkgs, ...}: {
  home.packages = with pkgs; [
    go
    python3Full
    nodejs_20
    rustc
    lua
    zig
    zls
  ];

  # conda
  home.file.".condarc".source = ./.condarc;
  # npm
  home.file.".npmrc".source = ./.npmrc;
  # stylua
  home.file.".config/stylua.toml".source = ./stylua.toml;
}
