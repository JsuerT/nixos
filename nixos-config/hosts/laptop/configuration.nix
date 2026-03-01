{ config, pkgs, ... }:

{
  imports = [
    ./hardware-configuration.nix   # Hardware vom Laptop
    ../../common/default.nix      # Gemeinsame Basis-Config
  ];

  networking.hostName = "nixos-laptop";

  # Laptop-spezifische Dinge (z.B. Touchpad oder Stromsparen)
  services.libinput.enable = true;

  system.stateVersion = "25.11"; 
}
