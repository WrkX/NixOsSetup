{ config, pkgs, ... }:

{
  imports =
    [
      ../system/hardware-configuration.nix
      ../system/nvidia.nix
      ../system/storage.nix
      ../system/system.nix
      ../packages/packages.nix
      ../packages/packages_dev.nix
      ../packages/packages_misc.nix
      ../packages/packages_work.nix
    ];

  time.timeZone = "Europe/Berlin";

  services.displayManager = {
    sddm = {
      enable = true;
      theme = "chili";
      wayland.enable = true;
    };
    autoLogin = {
      enable = true;
      user = "jonas";
    };
  };

  # Workaround for GNOME autologin: https://github.com/NixOS/nixpkgs/issues/103746#issuecomment-945091229
  systemd.services."getty@tty1".enable = false;
  systemd.services."autovt@tty1".enable = false;

  # Configure keymaps
  services.xserver.xkb = {
    layout = "de";
    variant = "";
  };
  console.keyMap = "de";

  users.users.jonas = {
    isNormalUser = true;
    description = "Jonas";
    extraGroups = ["networkmanager" "wheel" "gamemode" "libvirtd"];
    shell = pkgs.zsh;
  };

  xdg.mime.defaultApplications = {
      # Web and HTML
      "x-scheme-handler/http" = "zen-beta.desktop";
      "x-scheme-handler/https" = "zen-beta.desktop";
      "x-scheme-handler/chrome" = "zen-beta.desktop";
      "text/html" = "zen-beta.desktop";
      "application/x-extension-htm" = "zen-beta.desktop";
      "application/x-extension-html" = "zen-beta.desktop";
      "application/x-extension-shtml" = "zen-beta.desktop";
      "application/x-extension-xhtml" = "zen-beta.desktop";
      "application/xhtml+xml" = "zen-beta.desktop";

      # File management
      "inode/directory" = "org.kde.dolphin.desktop";

      # Text editor
      "text/plain" = "nvim.desktop";

      # Terminal
      "x-scheme-handler/terminal" = "kitty.desktop";

      # Videos
      "video/quicktime" = "mpv-2.desktop";
      "video/x-matroska" = "mpv-2.desktop";

      # LibreOffice formats
      "application/vnd.oasis.opendocument.text" = "libreoffice-writer.desktop";
      "application/vnd.oasis.opendocument.spreadsheet" = "libreoffice-calc.desktop";
      "application/vnd.oasis.opendocument.presentation" = "libreoffice-impress.desktop";
      "application/vnd.ms-excel" = "libreoffice-calc.desktop";
      "application/vnd.openxmlformats-officedocument.spreadsheetml.sheet" = "libreoffice-calc.desktop";
      "application/msword" = "libreoffice-writer.desktop";
      "application/vnd.openxmlformats-officedocument.wordprocessingml.document" = "libreoffice-writer.desktop";
      "application/vnd.ms-powerpoint" = "libreoffice-impress.desktop";
      "application/vnd.openxmlformats-officedocument.presentationml.presentation" = "libreoffice-impress.desktop";

      # PDF
      "application/pdf" = "zen-beta.desktop";

      # Torrents
      "application/x-bittorrent" = "org.qbittorrent.qBittorrent.desktop";
      "x-scheme-handler/magnet" = "org.qbittorrent.qBittorrent.desktop";

      # Other handlers
      "x-scheme-handler/about" = "zen-beta.desktop";
      "x-scheme-handler/unknown" = "zen-beta.desktop";
      "x-scheme-handler/postman" = "Postman.desktop";
      "x-scheme-handler/tonsite" = "org.telegram.desktop.desktop";
    };

  system.stateVersion = "24.11"; # Did you read the comment?
}
