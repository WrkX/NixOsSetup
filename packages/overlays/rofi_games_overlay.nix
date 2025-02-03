self: super: {
  rofi-games = super.rofi-games.overrideAttrs (oldAttrs: rec {
    pname = "rofi-games";
    version = "1.10.8";

    src = super.fetchFromGitHub {
      owner = "Rolv-Apneseth"; # Gib den richtigen User an
      repo = "rofi-games";
      tag = "v${version}";
      hash = "sha256-HWe1JtdRzuhbg3PHoVBq48TPgTXDfGrhEZR87uDw9Lo=";
    };

    cargoDeps = super.rustPlatform.fetchCargoTarball {
       inherit pname version src;
       hash = "sha256-14GiJHYHrjMiqlM3WYySsyeoU6mX0Jw+rSouinVE6v4=";
     };
  });
}
