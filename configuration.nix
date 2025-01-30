{ config, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
      ./nvidia.nix
      ./storage.nix
      ./packages.nix
      ./packages_misc.nix
      ./packages_work.nix
      #./packages_flakes.nix
      ./system.nix
    ];

  time.timeZone = "Europe/Berlin";

  services.displayManager = {
    sddm = {
      enable = true;
      theme = "chili";
      wayland.enable = true;
    };
    autoLogin = {
      enable = true;
      user = "jonas";
    };
  };

  # Workaround for GNOME autologin: https://github.com/NixOS/nixpkgs/issues/103746#issuecomment-945091229
  systemd.services."getty@tty1".enable = false;
  systemd.services."autovt@tty1".enable = false;

  # Configure keymaps
  services.xserver.xkb = {
    layout = "de";
    variant = "";
  };
  console.keyMap = "de";

  users.users.jonas = {
    isNormalUser = true;
    description = "Jonas";
    extraGroups = ["networkmanager" "wheel" "gamemode" "libvirtd"];
    shell = pkgs.zsh;
  };

  system.stateVersion = "24.11"; # Did you read the comment?
}
