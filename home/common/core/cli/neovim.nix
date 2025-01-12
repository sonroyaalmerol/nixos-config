{ inputs, pkgs, ... }: {
  imports = [
    inputs.nvchad4nix.homeManagerModule
  ];
  programs.nvchad = {
    enable = true;
    extraPackages = with pkgs; [
      nodePackages.bash-language-server
      docker-compose-language-service
      dockerfile-language-server-nodejs
      emmet-language-server
      nixd
      vscode-langservers-extracted
      clang-tools
      typescript
      basedpyright
      gopls
      hyprls
      nil
      prettierd
      prettier
      stylua
      typescript-language-server
    ];
    backup = false;
  };
}
