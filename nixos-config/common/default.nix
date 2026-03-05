{ config, pkgs, ... }:

{ nix.settings.experimental-features = [ "nix-command" "flakes" ];

  boot.loader.systemd-boot.enable = true; boot.loader.efi.canTouchEfiVariables = true;

  time.timeZone = "Europe/Berlin"; i18n.defaultLocale = "en_US.UTF-8";

  # Tastatur-Layout für die Konsole (TTY)
  console.keyMap = "de";

  # Tastatur-Layout für X11/Desktop
  services.xserver.xkb = { layout = "de"; variant = "";
  };

  # Unfree Software erlauben 
  nixpkgs.config.allowUnfree = true;

  users.users.ticco = { isNormalUser = true; description = "ticco"; extraGroups = [ "networkmanager" "wheel" ];
  };

  programs.firefox.enable = true;

  environment.systemPackages = with pkgs; [ vim git wget jetbrains.webstorm # Jetzt kannst du das Kommentarzeichen entfernen
  ];
}{ config, pkgs, ... }:

{
  # Alles, was beide Rechner teilen:
  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  boot.loader.systemd-boot.enable = true; boot.loader.efi.canTouchEfiVariables = true;

  time.timeZone = "Europe/Berlin"; i18n.defaultLocale = "en_US.UTF-8";

  # Dein User
  users.users.ticco = { isNormalUser = true; description = "ticco"; extraGroups = [ "networkmanager" "wheel" ];
  };

  # Gemeinsame Programme
  programs.firefox.enable = true; environment.systemPackages = with pkgs; [
    vim git wget
#    jetbrains.webstorm
  ];



services.xserver.xkb = { layout = "de"; variant = "";
}

nixpkgs.config.allowUnfree = true;
  # ... weitere gemeinsame Einstellungen (Networking, Sound etc.)
}
