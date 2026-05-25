{ config, pkgs, ... }:
{
  imports = [
    ./hardware-configuration.nix
    ./packages.nix
    ./desktop.nix
  ];


  programs.fish.enable = true;

  systemd.tmpfiles.rules = [
    "Z /etc/nixos 0755 karol users -"
  ];

  programs.neovim.enable = true;

  # boot.loader.systemd-boot.enable = true;
  boot.loader.limine.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  # Use latest kernel.
  boot.kernelPackages = pkgs.linuxPackages_latest;

  nixpkgs.config.allowUnfree = true;
  networking.hostName = "nixos"; # Define your hostname.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Enable networking
  networking.networkmanager.enable = true;

  # Set your time zone.
  time.timeZone = "Europe/Warsaw";

  # Select internationalisation properties.
  i18n.defaultLocale = "pl_PL.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "pl_PL.UTF-8";
    LC_IDENTIFICATION = "pl_PL.UTF-8";
    LC_MEASUREMENT = "pl_PL.UTF-8";
    LC_MONETARY = "pl_PL.UTF-8";
    LC_NAME = "pl_PL.UTF-8";
    LC_NUMERIC = "pl_PL.UTF-8";
    LC_PAPER = "pl_PL.UTF-8";
    LC_TELEPHONE = "pl_PL.UTF-8";
    LC_TIME = "pl_PL.UTF-8";
  };


  console.keyMap = "pl2";

  services.printing.enable = true;

  services.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
  };

  users.users.karol = {
    isNormalUser = true;
    description = "Karol Karłowski";
    extraGroups = [ "networkmanager" "wheel" ];
    packages = with pkgs; [
    ];
    shell = pkgs.fish;
  };

  # Allow unfree packages

  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  system.stateVersion = "25.11"; # Did you read the comment?

# W pliku /etc/nixos/configuration.nix

	virtualisation.libvirtd.enable = true;
	programs.virt-manager.enable = true; # Opcjonalne, ale pomaga w debugowaniu

	users.users.TWOJA_NAZWA_UZYTKOWNIKA = {
	  isNormalUser = true;
	  extraGroups = [ "wheel" "libvirtd" "kvm" ]; # Dodaj kvm i libvirtd
	};

}
