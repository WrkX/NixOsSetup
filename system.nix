# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

{
  boot = {
    loader = {
      systemd-boot.enable = true;
      efi.canTouchEfiVariables = true;
    };
    plymouth.enable = true;
  };

  nix = {
    gc = {
      automatic = true;
      options = "--delete-older-than 15d";
    };
    optimise = {
      automatic = true;
      dates = ["weekly"];
    };
    settings.experimental-features = [ "nix-command" ];
  };

  system.autoUpgrade= {
    enable = true;
    dates = "daily";
  };

  networking = {
    networkmanager.enable = true;
    hostName = "nixos"; # Define your hostname.
    #wireless.enable = true;
    #proxy.default = "http://user:password@proxy:port/";
    #proxy.noProxy = "127.0.0.1,localhost,internal.domain";
  };

  # Select internationalisation properties.
  i18n = {
    defaultLocale = "en_US.UTF-8";
    extraLocaleSettings = {
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
  };

  security = {
    sudo.wheelNeedsPassword = false;
    polkit.enable = true;
    rtkit.enable = true;
    wrappers.sunshine = {
      owner = "root";
      group = "root";
      capabilities = "cap_sys_admin+p";
      source = "${pkgs.sunshine}/bin/sunshine";
    };
  };

  services = {
    xserver = {
      enable = true;
      excludePackages = [ pkgs.xterm ];
    };
    printing.enable = true;
    pulseaudio.enable = false;
    gvfs.enable = true;
    tumbler.enable = true;
    pipewire = {
      enable = true;
      alsa.enable = true;
      alsa.support32Bit = true;
      pulse.enable = true;
    };
  };
}
