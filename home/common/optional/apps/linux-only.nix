{pkgs, ...}: {
  imports = [
    ./gpg.nix
  ];
  home.packages = with pkgs; [
    android-tools
    libgcc
    eog
    simple-scan
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
    parted
    pdfarranger
    psmisc
    sbctl
    shotwell
    signal-desktop
    udisks
    vscode-fhs
  ];
}
