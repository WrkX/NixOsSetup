{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
      pkgs.file-roller
      pkgs.fluent-reader
      pkgs.fzf
      pkgs.ghostty
      pkgs.git
      pkgs.imagemagick_light
      pkgs.libgccjit
      pkgs.neovim
      pkgs.ntfs3g
      pkgs.p7zip
      pkgs.playerctl
      (pkgs.python3.withPackages (python-packages: with python-packages; [requests]))
      pkgs.recordbox
      pkgs.stow
      pkgs.streamrip
      pkgs.sunshine
      pkgs.xdragon
      pkgs.yazi
      pkgs.zathura
      pkgs.zed-editor
      pkgs.zoxide
      pkgs.zsh-powerlevel10k
  ];

  programs = {
    zsh = {
      enable = true;
      enableCompletion = true;
      syntaxHighlighting.enable = true;
      ohMyZsh = {
        enable = true;
        plugins = ["git"];
      };
      promptInit = "source ${pkgs.zsh-powerlevel10k}/share/zsh-powerlevel10k/powerlevel10k.zsh-theme";
      histSize = 10000;
    };
  };
}
