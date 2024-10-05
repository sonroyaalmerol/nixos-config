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
      tailwindcss
      typescript
      basedpyright
      gopls
      omnisharp-roslyn
      templ
      htmx-lsp
      hyprls
      nil
    ];
    backup = false;
  };
}
