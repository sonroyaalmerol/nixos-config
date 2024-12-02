{
  programs.brave = {
    enable = true;
    commandLineArgs = [
      "--enable-features=VaapiVideoDecodeLinuxGL"
      "--use-gl=angle"
      "--use-angle=gl"
    ];
  };
}
