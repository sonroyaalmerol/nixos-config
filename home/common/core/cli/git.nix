{
  programs.git = {
    enable = true;
    userEmail = "github@snry.me";
    userName = "Son Roy Almerol";
    extraConfig = {
      core.editor = "nvim";
      init.defaultBranch = "main";
      gpg = {
        format = "ssh";
        "ssh" = {
          program = "op-ssh-sign";
        };
      };
      commit.gpgSign = true;
      merge.conflictStyle = "zdiff3";
      branch.sort = "committerdate";
      push.autoSetupRemote = true;
    };
    delta = {
      enable = true;
      options = {
        features = "line-numbers decorations";
      };
    };
    lfs.enable = true;
    ignores = [
      ".direnv/"
      ".devenv/"
      ".venv/"
      ".env"
    ];
  };
}
