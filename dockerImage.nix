{ pkgs, program }:

pkgs.dockerTools.buildLayeredImage {
  name = "cuda-docker-image";
  tag = "latest";

  contents = [ program ];
  config = {
    Cmd = "cuda-program";
    Env = [
      "CUDA_VERSION=${program.cudatoolkit.version}"
      "NVIDIA_VISIBLE_DEVICES=all"
      "NVIDIA_DRIVER_CAPABILITIES=compute,utility"
    ];
  };
}
