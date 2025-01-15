# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

{
    environment.systemPackages = with pkgs; [
      pkgs.git
      pkgs.kitty
      pkgs.waybar
      pkgs.lxqt.lxqt-policykit
      pkgs.xfce.thunar
      pkgs.kdePackages.kate
      pkgs.discord-canary
      pkgs.ntfs3g
      pkgs.zed-editor
      pkgs.hyprpaper
      pkgs.networkmanagerapplet
      pkgs.hyprcursor
      pkgs.dunst
      pkgs.goverlay
      pkgs.gamemode
      pkgs.neofetch
      pkgs.pamixer
      pkgs.pavucontrol
      pkgs.protonup-qt
      pkgs.alejandra
      (pkgs.rofi.override { plugins = [ pkgs.rofi-games ]; })
      pkgs.stow
      pkgs.teams-for-linux
      pkgs.heroic
      pkgs.wlogout
      pkgs.winetricks
      pkgs.killall
      pkgs.hyprshot
      pkgs.unar
      pkgs.zsh-powerlevel10k
  ];

  fonts.packages = with pkgs; [
    pkgs.nerd-fonts.iosevka
  ];

  programs.hyprland.enable = true;
  programs.firefox.enable = true;
  programs.xfconf.enable = true;
  programs.steam.enable = true;
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    syntaxHighlighting.enable = true;
    ohMyZsh = {
      enable = true;
      plugins = ["git"];
    };
    promptInit = "source ${pkgs.zsh-powerlevel10k}/share/zsh-powerlevel10k/powerlevel10k.zsh-theme";
    shellAliases = {
      ll = "ls -l";
      update = "sudo nixos-rebuild switch";
    };
    histSize = 10000;
  };
  programs.thunar.plugins = with pkgs.xfce; [
    thunar-archive-plugin
    thunar-volman
  ];
}
