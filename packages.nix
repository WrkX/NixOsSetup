{ config, pkgs, ... }:

{
  nixpkgs.config.allowUnfree = true;
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
    pkgs.yazi
    pkgs.python3Full
    pkgs.libgccjit
    pkgs.whitesur-cursors
    pkgs.libnotify
    pkgs.playerctl
    pkgs.neovim
    pkgs.wineWowPackages.waylandFull
    #(pkgs.callPackage packages/hyprswitch/hyprswitch.nix {})
    (pkgs.callPackage (builtins.fetchurl "https://raw.githubusercontent.com/WrkX/nixpkgs/refs/heads/master/pkgs/by-name/ga/gamescope/gamescope.nix") {})
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
      gamescopeSession.enable = true;
      package = pkgs.steam.override {
      extraPkgs = (pkgs: with pkgs; [
        gamemode
        # additional packages...
        # e.g. some games require python3
        ]);
      };
    };
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
