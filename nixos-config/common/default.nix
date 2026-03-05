{ config, pkgs, ... }: # <-- Nur hier ganz oben!

{
  # ... dein ganzer Inhalt (nix.settings, users, etc.)

  environment.systemPackages = with pkgs; [
    vim
    git
    wget
    jetbrains.webstorm
  ];

  services.xserver.xkb = {
    layout = "de";
    variant = "";
  };

  nixpkgs.config.allowUnfree = true;
} # <-- Das hier muss die ALLERLETZTE Zeile sein!
