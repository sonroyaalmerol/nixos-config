{pkgs, ...}: {
  imports = [
    ./gpg.nix
  ];
  home.packages = with pkgs; [
    android-tools
    esphome
    libgcc
    eog
    simple-scan
    gnome-keyring
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
    qmk
    vscode-fhs
    via
  ];
}
