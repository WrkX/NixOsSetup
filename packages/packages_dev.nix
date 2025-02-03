{ config, pkgs, inputs, system, ... }:

{

  environment.systemPackages = with pkgs; [
    pkgs.libgcc
    (pkgs.python3.withPackages (python-packages: with python-packages; [requests  pyfiglet]))
    pkgs.zed-editor
    inputs.nixCats.packages.${system}.default
  ];

  programs.tmux = {
    enable = true;
    extraConfig = ''
      set -g default-command ${pkgs.zsh}/bin/zsh
      '';
  };
}
