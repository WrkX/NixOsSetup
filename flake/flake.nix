{
  description = "Ein Nix Flake für Zen Browser mit flake-compat";

  # Eingabepakete
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";  # Nixpkgs
    flake-compat.url = "github:nixos/flake-compat";       # flake-compat
  };

  # Ausgaben
  outputs = { self, nixpkgs, flake-compat, ... }:
    let
      # Importiere Nixpkgs, um auf das System zugreifen zu können
      pkgs = import nixpkgs {
        system = "x86_64-linux";  # Dein Systemarchitektur (kann auch "aarch64-linux" sein, falls du ARM benutzt)
      };

      # Nutze flake-compat, um Zen Browser zu integrieren
      zenBrowser = flake-compat.overrideAttrs (oldAttrs: rec {
        name = "zen-browser";
        version = "latest";  # Du kannst hier eine bestimmte Version angeben, falls gewünscht
      });
    in
    {
      # Definiert das Paket für Zen Browser
      packages.x86_64-linux.zenBrowser = zenBrowser;

      # Optional: Definiere eine Entwicklungsumgebung, in der du Zen Browser verwenden kannst
      devShell.x86_64-linux = pkgs.mkShell {
        buildInputs = [ zenBrowser ];
      };
    };
}
