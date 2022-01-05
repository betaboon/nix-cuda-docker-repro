let

  pkgs = import <nixpkgs> {
    config = {
      allowUnfree = true;
      cudaSupport = true;
    };
  };

  program = pkgs.callPackage ./program.nix { };
  dockerImage = pkgs.callPackage ./dockerImage.nix { inherit program; };

in
{

  inherit program dockerImage;

}
