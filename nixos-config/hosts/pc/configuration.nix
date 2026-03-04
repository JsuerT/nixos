{ config, pkgs, ... }:

{
  imports = [
    ./hardware-configuration.nix
    ../../common/default.nix
  ];

  networking.hostName = "nixos-pc";

nixpkgs.config.allowUnfree = true;
  # HIER kommt der Unterschied:
  programs.steam.enable = true; # Nur auf dem PC!

  system.stateVersion = "25.11";
}

