with import <nixpkgs> {};

pkgs.mkShell {
  packages = [
    (pkgs.lua.withPackages (ps: [
      ps.luafilesystem
      ps.moonscript
    ]))
  ];

  #shellHook = ''
  #'';
}
