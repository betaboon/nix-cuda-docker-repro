{ stdenv, cudatoolkit }:

stdenv.mkDerivation rec {
  pname = "cuda-program";
  version = "0.0.1-cuda${cudatoolkit.version}";
  src = ./src;

  buildInputs = [
    cudatoolkit
  ];

  buildPhase = ''
    nvcc -o main main.cu
  '';

  installPhase = ''
    mkdir -p $out/bin
    cp main $out/bin/${pname}
  '';

  passthru.cudatoolkit = cudatoolkit;
}
