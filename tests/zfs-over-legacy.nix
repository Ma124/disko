{ pkgs ? import <nixpkgs> { }
, diskoLib ? pkgs.callPackage ../lib { }
}:
diskoLib.testLib.makeDiskoTest {
  inherit pkgs;
  name = "zfs-over-legacy";
  disko-config = ../example/zfs-over-legacy.nix;
  extraTestScript = ''
    machine.succeed("test -e /zfs_fs");
    machine.succeed("mountpoint /zfs_fs");
  '';
}

