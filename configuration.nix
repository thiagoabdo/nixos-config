# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
     <home-manager/nixos>
    ];

  # Bootloader.
  boot.loader.grub.enable = true;
  boot.loader.grub.device = "/dev/vda";
  boot.loader.grub.useOSProber = true;

  # Setup keyfile
  boot.initrd.secrets = {
    "/crypto_keyfile.bin" = null;
  };

  boot.loader.grub.enableCryptodisk=true;

  boot.initrd.luks.devices."luks-bdf081b8-5dae-4d92-a3a1-3db5bdbc2d82".keyFile = "/crypto_keyfile.bin";
  networking.hostName = "nixos"; # Define your hostname.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Enable networking
  networking.networkmanager.enable = true;

  # Set your time zone.
  time.timeZone = "America/Sao_Paulo";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "pt_BR.UTF-8";
    LC_IDENTIFICATION = "pt_BR.UTF-8";
    LC_MEASUREMENT = "pt_BR.UTF-8";
    LC_MONETARY = "pt_BR.UTF-8";
    LC_NAME = "pt_BR.UTF-8";
    LC_NUMERIC = "pt_BR.UTF-8";
    LC_PAPER = "pt_BR.UTF-8";
    LC_TELEPHONE = "pt_BR.UTF-8";
    LC_TIME = "pt_BR.UTF-8";
  };

  # Configure keymap in X11
  services.xserver = {
    layout = "br";
    xkbVariant = "nodeadkeys";
  };

  fonts = {
    enableDefaultPackages = true;
    packages = with pkgs; [
      nerdfonts
    ];
  };

  # Configure console keymap
  console.keyMap = "br-abnt2";

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.tjota = {
    isNormalUser = true;
    description = "Thiago";
    extraGroups = [ "networkmanager" "wheel" ];
    packages = with pkgs; [];
  };

  home-manager.users.tjota = { pkgs, config, ... }: {
    # The state version is required and should stay at the version you
    # originally installed.
    home.stateVersion = "23.11";

    home.file = {
      ".config/nvim"	= {
        source = config.lib.file.mkOutOfStoreSymlink "/home/tjota/nixos-config/dotfiles/nvim/.config/nvim";
        force = true;
      };
      ".config/i3" = {
        source = config.lib.file.mkOutOfStoreSymlink "/home/tjota/nixos-config/dotfiles/i3/.i3";
        force = true;
      };
      ".i3status" = {
        source = config.lib.file.mkOutOfStoreSymlink "/home/tjota/nixos-config/dotfiles/i3/.i3status";
        force = true;
      };
      ".config/tmux" = {
        source = config.lib.file.mkOutOfStoreSymlink "/home/tjota/nixos-config/dotfiles/tmux/.config/tmux";
        force = true;
      };
      ".zshrc" = { 
        source = config.lib.file.mkOutOfStoreSymlink "/home/tjota/nixos-config/dotfiles/zsh/.zshrc"; 
        force = true;
      };
      ".p10k.zsh" = {
        source = config.lib.file.mkOutOfStoreSymlink "/home/tjota/nixos-config/dotfiles/zsh/.p10k.zsh"; 
        force = true;
      };
      ".local/scripts/tmux-sessionizer" = {
        source = config.lib.file.mkOutOfStoreSymlink "/home/tjota/nixos-config/dotfiles/private_scripts/.local/scripts/tmux-sessionizer"; 
        force = true;
      };
    };
  };


  users.defaultUserShell = pkgs.zsh;

  xdg.portal = {
    enable = true;
    wlr.enable = true;
    config.common.default = "*";
  };


  # Enable automatic login for the user.
  services.getty.autologinUser = "tjota";

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    wget
    git
    nodejs
    pkgs.alacritty
    pkgs.zsh
    pkgs.stow
    pkgs.freerdp
    pkgs.firefox
    pkgs.gcc
    pkgs.go
    pkgs.cmake
    pkgs.cargo
    pkgs.rustc
    fzf
    conky
    zoxide
  ];

  environment.pathsToLink = [ "/libexec" ]; # links /libexec from derivations to /run/current-system/sw 
  environment.variables.TERMINAL = "alacritty";
  services.xserver = {
    enable = true;

    desktopManager = {
      xterm.enable = false;
    };
   
    displayManager = {
        defaultSession = "none+i3";
    };

    windowManager.i3 = {
      enable = true;
      extraPackages = with pkgs; [
        dmenu #application launcher most people use
        i3status # gives you the default i3 status bar
        i3lock #default i3 screen locker
     ];
    };
  };
  services.xserver.windowManager.i3.package = pkgs.i3-gaps;

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

  # List services that you want to enable:

  # Enable the OpenSSH daemon.
  services.openssh.enable = true;

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "23.11"; # Did you read the comment?
  programs.neovim = {
    enable = true;
    defaultEditor = true;
    viAlias = true;
    vimAlias = true;
  };

  programs.zsh.enable = true;

}
