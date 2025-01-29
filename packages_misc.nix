{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
      pkgs.file-roller
      pkgs.fluent-reader
      pkgs.fzf
      pkgs.gapless
      pkgs.git
      pkgs.imagemagick_light
      pkgs.jq
      pkgs.libgccjit
      pkgs.ntfs3g
      pkgs.ouch
      pkgs.p7zip
      pkgs.picard
      pkgs.playerctl
      (pkgs.python3.withPackages (python-packages: with python-packages; [requests  pyfiglet]))
      pkgs.qemu
      pkgs.quickemu
      pkgs.socat
      pkgs.stow
      pkgs.sunshine
      pkgs.xdragon
      pkgs.yazi
      pkgs.zathura
      pkgs.zed-editor
      pkgs.zoxide
      pkgs.zsh-powerlevel10k
  ];
}
