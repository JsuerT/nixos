{ config, pkgs, ... }:

{
  # Alles, was beide Rechner teilen:
  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  time.timeZone = "Europe/Berlin";
  i18n.defaultLocale = "en_US.UTF-8";

  # Dein User
  users.users.ticco = {
    isNormalUser = true;
    description = "ticco";
    extraGroups = [ "networkmanager" "wheel" ];
  };

  # Gemeinsame Programme
  programs.firefox.enable = true;
  environment.systemPackages = with pkgs; [
    vim
    git
    wget
    jetbrains.webstorm
  ];

  # ... weitere gemeinsame Einstellungen (Networking, Sound etc.)
}
