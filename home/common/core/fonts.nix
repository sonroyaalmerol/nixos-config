{pkgs, ...}: {
  fonts.fontconfig.enable = true;
  home.packages = with pkgs; [
    nerd-fonts.fira-code
    nerd-fonts.caskaydia-cove
    nerd-fonts.fantasque-sans-mono
    font-awesome
    noto-fonts
    noto-fonts-emoji
    recursive
    sn-pro
    ia-writer-quattro
    ia-writer-duospace
    libre-baskerville
    monaspace
  ];
}
