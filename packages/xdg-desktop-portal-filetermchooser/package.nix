{
  stdenv,
  fetchgit,
  lib,
  xdg-desktop-portal,
  ninja,
  meson,
  pkg-config,
  inih,
  systemd,
  scdoc,
  pipewire,
  wayland,
  wayland-protocols,
  libgbm,
  wayland-scanner,
}:
stdenv.mkDerivation {
  pname = "xdg-desktop-portal-termfilechooser";
  version = "0.4.0";

  src = fetchgit {
    url = "https://github.com/hunkyburrito/xdg-desktop-portal-termfilechooser";
    rev = "6db2f69c2587ea5df7f34c096497c42903269d1a";
    hash = "sha256-I7wgTaTBKOjFpgZ7RuhB3G7Js1OH1/NgzoOcqpdbOG0=";
  };

  nativeBuildInputs = [
    meson
    ninja
    pkg-config
    scdoc
    wayland-scanner
  ];

  buildInputs = [
    xdg-desktop-portal
    inih
    systemd
    pipewire
    wayland
    wayland-protocols
    libgbm
  ];

  mesonFlags = [
    (lib.mesonOption "sd-bus-provider" "libsystemd")
    (lib.mesonOption "sysconfdir" "/etc")
  ];

  meta = with lib; {
    description = "xdg-desktop-portal backend for choosing files with your favorite file chooser";
    homepage = "https://github.com/boydaihungst/xdg-desktop-portal-termfilechooser";
    license = licenses.mit;
    platforms = platforms.linux;
    maintainers = with lib.maintainers; [ body20002 ];
    mainProgram = "xdg-desktop-portal-termfilechooser";
  };
}
