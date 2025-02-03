{ config, pkgs, inputs, system, ... }:

#let
#  zenBrowserPackage = inputs.zen-browser.packages."${system}".twilight;
#in
{
  environment.systemPackages = with pkgs; [
    pkgs.cliphist
    pkgs.file-roller
    pkgs.fluent-reader
    pkgs.fzf
    pkgs.gapless
    pkgs.git
    pkgs.imagemagick_light
    pkgs.jq
    pkgs.ntfs3g
    pkgs.ouch
    pkgs.p7zip
    pkgs.picard
    pkgs.playerctl
    pkgs.qemu
    pkgs.quickemu
    pkgs.socat
    pkgs.stow
    pkgs.sunshine
    pkgs.wl-clipboard
    pkgs.xdragon
    pkgs.yazi
    pkgs.zathura
    pkgs.zoxide
    pkgs.zsh-powerlevel10k
    inputs.zen-browser.packages."${system}".twilight
  ];
}
