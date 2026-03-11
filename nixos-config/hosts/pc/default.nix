{ config, pkgs, ... }:

{
  imports = [
    ../../modules/common.nix
    ./hardware-configuration.nix
  ];

  networking.hostName = "pc";
  # Hier nur PC-spezifische Sachen wie Nvidia-Treiber etc.
}
