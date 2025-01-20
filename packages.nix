{ config, pkgs, ... }:

{
  nixpkgs.config.allowUnfree = true;
  environment.systemPackages = with pkgs; [
    pkgs.discord-canary
    pkgs.dunst
    pkgs.fastfetch
    pkgs.goverlay
    pkgs.heroic
    pkgs.hyprcursor
    pkgs.hyprpaper
    pkgs.hyprshot
    pkgs.kdePackages.kate
    pkgs.kitty
    pkgs.libnotify
    pkgs.lxqt.lxqt-policykit
    pkgs.networkmanagerapplet
    pkgs.pamixer
    pkgs.pavucontrol
    pkgs.protonplus
    pkgs.waybar
    pkgs.winetricks
    pkgs.wineWowPackages.waylandFull
    pkgs.wlogout
    pkgs.xfce.thunar
    (pkgs.rofi.override { plugins = [ pkgs.rofi-games ]; })
    (pkgs.callPackage (builtins.fetchurl "https://raw.githubusercontent.com/WrkX/nixpkgs/refs/heads/master/pkgs/by-name/ga/gamescope/gamescope.nix") {})
    (pkgs.callPackage (builtins.fetchurl "https://raw.githubusercontent.com/WrkX/nixpkgs/refs/heads/master/pkgs/by-name/hy/hyprswitch/package.nix") {})#packages/hyprswitch/package.nix {})
    #(pkgs.callPackage (builtins.fetchurl "https://raw.githubusercontent.com/nani8ot/nixpkgs/refs/heads/master/nixos/modules/config/xdg/portals/termfilechooser.nix") {})
  ];

  fonts.packages = with pkgs; [
    pkgs.nerd-fonts.iosevka
    pkgs.nerd-fonts.jetbrains-mono
    (pkgs.callPackage packages/fonts/sfpro/sfpro.nix {})
  ];

  programs = {
    hyprland.enable = true;
    gamemode.enable = true;
    firefox.enable = true;
    xfconf.enable = true;
    steam = {
      enable = true;
      #gamescopeSession.enable = true;
      package = pkgs.steam.override {
      extraPkgs = (pkgs: with pkgs; [
        gamemode
        ]);
      };
    };
  };
}
