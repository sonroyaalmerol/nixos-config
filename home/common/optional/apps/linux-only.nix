{pkgs, ...}: {
  imports = [
    ./gpg.nix
  ];
  home.packages = with pkgs; [
    libgcc
    eog
    gnome.simple-scan
    gnome-keyring
    gnome-session
    nautilus
    seahorse
    gparted
    libreoffice-fresh
    libsForQt5.okular
    logseq
    lshw
    morgen
    obsidian
    pdfarranger
    psmisc
    sbctl
    signal-desktop
    udisks
    vscode-fhs
  ];
}
