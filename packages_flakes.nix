{ config, pkgs, ... }:

let
  zen-browser = import packages/zen-browser-flake { };
in
{
  # Your existing package definitions
  myZenBrowser = zen-browser;
}
