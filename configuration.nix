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
      ./system.nix
    ];

  time.timeZone = "Europe/Berlin";

  services.xserver.displayManager.gdm.enable = true;
  #services.xserver.desktopManager.gnome.enable = true;
  services.displayManager.autoLogin.enable = true;
  services.displayManager.autoLogin.user = "jonas";
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
