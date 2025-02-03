{ config, pkgs, lib, ... }:

{
  nixpkgs = {
    config.allowUnfree = true;
    overlays = [
      (import ./overlays/rofi_games_overlay.nix)
      (import ./overlays/sddm-chili-theme_overlay.nix)
    ];
  };

  environment.systemPackages = with pkgs; [
    pkgs.discord-canary
    pkgs.dunst
    pkgs.fastfetch
    pkgs.heroic
    pkgs.hyprcursor
    pkgs.hypridle
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
    pkgs.qimgv
    pkgs.sddm-chili-theme
    pkgs.waybar
    pkgs.winetricks
    pkgs.wine
    pkgs.wlogout
    pkgs.xdg-desktop-portal
    pkgs.xdg-desktop-portal-gtk
    pkgs.xfce.thunar
    (pkgs.rofi-wayland.override { plugins = [ pkgs.rofi-games ]; })
    (pkgs.callPackage (builtins.fetchurl "https://raw.githubusercontent.com/WrkX/nixpkgs/refs/heads/master/pkgs/by-name/ga/gamescope/gamescope.nix") {})
    (pkgs.callPackage (builtins.fetchurl "https://raw.githubusercontent.com/WrkX/nixpkgs/refs/heads/master/pkgs/by-name/hy/hyprswitch/package.nix") {})#packages/hyprswitch/package.nix {})
    (pkgs.callPackage (builtins.fetchurl "https://raw.githubusercontent.com/WrkX/nixpkgs/refs/heads/master/pkgs/by-name/xd/xdg-desktop-portal-termfilechooser/package.nix") {})
  ];

  fonts.packages = with pkgs; [
    pkgs.nerd-fonts.iosevka
    pkgs.nerd-fonts.jetbrains-mono
    (pkgs.callPackage custom_packages/fonts/sfpro/sfpro.nix {})
  ];

  programs = {
    gamemode.enable = true;
    hyprland.enable = true;
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
    zsh = {
      enable = true;
      shellInit = ''
        export ZDOTDIR=$HOME/.config/zsh
        '';
    };
  };
}
