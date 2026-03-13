{ config, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
#      ./hardware-configuration.nix
    ];

nix.settings.experimental-features = [ "nix-command" "flakes" ];

  # Bootloader
  boot.loader.efi.canTouchEfiVariables = true;
  boot.loader.grub.enable = true; 
  boot.loader.grub.devices = [ "nodev" ];
  boot.loader.grub.efiSupport = true;
  boot.loader.grub.useOSProber = true;

  # Networking
  networking.networkmanager.enable = true;

  # Set your time zone.
  time.timeZone = "Europe/Berlin";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_GB.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "de_DE.UTF-8";
    LC_IDENTIFICATION = "de_DE.UTF-8";
    LC_MEASUREMENT = "de_DE.UTF-8";
    LC_MONETARY = "de_DE.UTF-8";
    LC_NAME = "de_DE.UTF-8";
    LC_NUMERIC = "de_DE.UTF-8";
    LC_PAPER = "de_DE.UTF-8";
    LC_TELEPHONE = "de_DE.UTF-8";
    LC_TIME = "de_DE.UTF-8";
  };

  hardware.graphics.enable=true;

  #bluetoothh
  hardware.bluetooth.enable=true;
  hardware.bluetooth.powerOnBoot=true;
  services.blueman.enable=true;

  # Enable the X11 windowing system.
  services.xserver.enable = true;

  # Desktop Manager (LXQt)
  services.xserver.displayManager.lightdm.enable = true;
  services.xserver.desktopManager.lxqt.enable = true;

  # Configure keymap in X11
  services.xserver.xkb = {
    layout = "de";
    variant = "";
  };

  # Configure console keymap
  console.keyMap = "de";

  # Enable CUPS to print documents.
  services.printing.enable = true;

  # Enable sound with pipewire.
  services.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
  };

  # Define a user account.
  users.users.ticco = {
    isNormalUser = true;
    description = "ticco";
    extraGroups = [ "networkmanager" "wheel" ];
    packages = with pkgs; [
      kdePackages.kate
    ];
  };

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # Firefox
  programs.firefox.enable = true;

  environment.systemPackages = with pkgs; [
    git
    xorg.xhost
    jetbrains.webstorm
    libreoffice-fresh
    fzf
    ripgrep
    xclip
    
    (vim-full.customize {
      name = "vim";
      vimrcConfig = {
        packages.myVimPackage = with pkgs.vimPlugins; {
          start = [ 
            vim-airline
            vim-airline-themes
            nerdtree
            vim-fugitive
            vim-gitgutter
            vim-surround
            vim-commentary
            fzf-vim
            gruvbox
            vim-polyglot
            indentLine
            auto-pairs
          ];
        };
        customRC = ''
          syntax on
          set number
          set relativenumber
          set termguicolors
          set encoding=utf-8
          set shiftwidth=2
          set expandtab
          set mouse=a

          " Theme Einstellungen
          colorscheme gruvbox
          let g:airline_theme='gruvbox'
          let g:airline_powerline_fonts = 1

          " Keybindings
          let mapleader = " "

          " Strg + n öffnet den Dateibaum (NERDTree)
          nnoremap <C-n> :NERDTreeToggle<CR>

          " Leertaste + ff sucht nach Dateien
          nnoremap <leader>ff :Files<CR>
          
          " Leertaste + fg sucht in Git-Dateien
          nnoremap <leader>fg :GFiles<CR>
        '';
      };
    })
  ];

  # State Version
  system.stateVersion = "25.11";
}
