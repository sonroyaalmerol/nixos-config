{pkgs, ...}: {
  qt = {
    enable = true;
    style = {
      catppuccin = {
        enable = true;
        apply = true;
      };
    };
  };
}
