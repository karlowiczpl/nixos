{ config, pkgs, ... }:
{
  programs.fish.enable = true;

  imports = [
    ./hardware-configuration.nix
    ./packages.nix
    ./desktop.nix
    ./virtual.nix
  ];

  systemd.tmpfiles.rules = [
    "Z /etc/nixos 0755 karol users -"
  ];

  services.udev.extraRules = ''
    # Microchip PICkit 3
    ATTRS{idVendor}=="04d8", ATTRS{idProduct}=="0033", MODE="0666", GROUP="plugdev"
    # Microchip PICkit 4
    ATTRS{idVendor}=="04d8", ATTRS{idProduct}=="9012", MODE="0666", GROUP="plugdev"
    # Microchip ICD 4
    ATTRS{idVendor}=="04d8", ATTRS{idProduct}=="9011", MODE="0666", GROUP="plugdev"
    # Ogólna reguła dla reszty narzędzi Microchipa
    SUBSYSTEM=="usb", ATTRS{idVendor}=="04d8", MODE="0666", GROUP="plugdev"
  '';

  hardware.graphics = {
    enable = true;
    enable32Bit = true;
  };

  hardware.bluetooth = {
    enable = true;
    powerOnBoot = true;
  };

  boot.loader.limine.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;


  boot.kernelPackages = pkgs.linuxPackages_latest;

  nixpkgs.config.allowUnfree = true;
  networking.hostName = "karolpc";

  networking.networkmanager.enable = true;

  time.timeZone = "Europe/Warsaw";

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

  services.printing = {
    enable = true;
    drivers = [ pkgs.hplip ];
  };

  services.avahi = {
    enable = true;
    nssmdns4 = true;
    openFirewall = true;
  };

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
    extraGroups = [ "networkmanager" "wheel" "dialout" "tty" ];
    packages = with pkgs; [
    ];
    shell = pkgs.fish;
  };

  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  system.stateVersion = "25.11";
}
