{ pkgs, inputs, config, ... }:

{
  home = {
    packages = with pkgs; [
      cmake
      python3
      gcc-arm-embedded
      gnumake
      binutils
      picotool
      minicom
      python3Packages.pyserial
    ];

    file."Repo/pico/sdk".source = inputs.pico-sdk;

    sessionVariables = {
      PICO_SDK_PATH = "/home/karol/Repo/pico/sdk/";
    };
  };
}
