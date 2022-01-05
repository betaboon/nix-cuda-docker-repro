{ pkgs, program }:

pkgs.dockerTools.buildLayeredImage {
  name = "cuda-docker-image";
  tag = "latest";

  contents = [ program ];

  # required for ldconfig
  extraCommands = ''
    mkdir -p tmp
  '';

  config = {
    Cmd = "cuda-program";
    Env = [
      "CUDA_VERSION=${program.cudatoolkit.version}"
      "NVIDIA_VISIBLE_DEVICES=all"
      "NVIDIA_DRIVER_CAPABILITIES=compute,utility"
      "LD_LIBRARY_PATH=/usr/lib64"
    ];
  };
}
