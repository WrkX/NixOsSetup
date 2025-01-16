# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

{
  fileSystems."/home" =
    { device = "/dev/disk/by-uuid/6cd49b4e-89db-475a-ac95-688c4145b779";
      fsType = "btrfs";
    };

  fileSystems."/mnt/games" =
    { device = "/dev/disk/by-uuid/48605ED07EF02F1B";
      fsType = "ntfs-3g";
      options = [ "rw" "uid=1000" ];
    };
}
