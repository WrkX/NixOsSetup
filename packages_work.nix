{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    pkgs.citrix_workspace
    pkgs.teams-for-linux
  ];
}
