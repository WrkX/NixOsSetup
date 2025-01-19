{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
      pkgs.file-roller
      pkgs.git
      pkgs.fzf
      pkgs.zoxide
      pkgs.imagemagick_light
      pkgs.libgccjit
      pkgs.neovim
      pkgs.p7zip
      pkgs.python3Full
      pkgs.recordbox
      pkgs.streamrip
      pkgs.stow
      pkgs.sunshine
      pkgs.xdragon
      pkgs.yazi
      pkgs.zathura
      pkgs.zathura
      pkgs.zed-editor
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
