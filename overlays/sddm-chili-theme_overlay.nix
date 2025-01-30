self: super: let
  sddmImage = super.fetchurl {
    url = "https://4kwallpapers.com/images/wallpapers/macos-catalina-mountains-island-daytime-stock-5k-3840x2160-188.jpg";  # Ersetze die URL mit der tatsächlichen URL des Bildes
    sha256 = "sha256-2ssMt1RetKGEnonMoV8H/bK0JURi+9X0kwn1mayxNLE=";
  };
in {
  sddm-chili-theme = super.sddm-chili-theme.overrideAttrs (oldAttrs: {
    postInstall = oldAttrs.postInstall or "" + ''
      # Bild in den entsprechenden Ordner kopieren
      cp ${sddmImage} $out/share/sddm/themes/chili/assets/sddm.jpg

      # theme.conf.user erstellen oder anpassen
      echo "[General]" > $out/share/sddm/themes/chili/theme.conf.user
      echo "background=assets/sddm.jpg" >> $out/share/sddm/themes/chili/theme.conf.user
      echo "blur=false" >> $out/share/sddm/themes/chili/theme.conf.user
      echo "ScreenWidth=3440" >> $out/share/sddm/themes/chili/theme.conf.user
      echo "ScreenHeight=1440" >> $out/share/sddm/themes/chili/theme.conf.user
    '';
  });
}
