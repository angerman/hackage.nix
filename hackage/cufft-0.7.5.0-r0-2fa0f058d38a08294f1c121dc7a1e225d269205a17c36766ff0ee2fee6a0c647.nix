{ system
  , compiler
  , flags
  , pkgs
  , hsPkgs
  , pkgconfPkgs
  , errorHandler
  , config
  , ... }:
  {
    flags = {};
    package = {
      specVersion = "1.22";
      identifier = { name = "cufft"; version = "0.7.5.0"; };
      license = "BSD-3-Clause";
      copyright = "";
      maintainer = "Robert Clifton-Everest <robertce@cse.unsw.edu.au>";
      author = "Robert Clifton-Everest, Trevor L. McDonell";
      homepage = "https://github.com/robeverest/cufft";
      url = "";
      synopsis = "Haskell bindings for the CUFFT library";
      description = "This library contains FFI bindings to the CUFFT library, which provides\nhighly optimised, FFTW compatible, Fast-Fourier Transform (FFT)\nimplementations for NVIDIA GPUs. The CUFFT library is part of the CUDA\ndeveloper toolkit.\n\n<http://developer.nvidia.com/cuda-downloads>\n\nThe configure script will look for your CUDA installation in the standard\nplaces, and if the `nvcc` compiler is in your PATH, relative to that.\n\nThis release tested with versions 6.5, 7.0, and 7.5 of the CUDA toolkit.\n";
      buildType = "Custom";
      setup-depends = [
        (hsPkgs.buildPackages.base or (pkgs.buildPackages.base or (errorHandler.setupDepError "base")))
        (hsPkgs.buildPackages.Cabal or (pkgs.buildPackages.Cabal or (errorHandler.setupDepError "Cabal")))
        (hsPkgs.buildPackages.directory or (pkgs.buildPackages.directory or (errorHandler.setupDepError "directory")))
        (hsPkgs.buildPackages.filepath or (pkgs.buildPackages.filepath or (errorHandler.setupDepError "filepath")))
        (hsPkgs.buildPackages.template-haskell or (pkgs.buildPackages.template-haskell or (errorHandler.setupDepError "template-haskell")))
        ];
      };
    components = {
      "library" = {
        depends = [
          (hsPkgs."base" or (errorHandler.buildDepError "base"))
          (hsPkgs."cuda" or (errorHandler.buildDepError "cuda"))
          ];
        build-tools = [
          (hsPkgs.buildPackages.c2hs.components.exes.c2hs or (pkgs.buildPackages.c2hs or (errorHandler.buildToolDepError "c2hs:c2hs")))
          ];
        buildable = true;
        };
      };
    }