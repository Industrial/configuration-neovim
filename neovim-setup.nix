with (import <nixpkgs> {});
derivation {
  name = "neovim-setup";
  builder = "${bash}/bin/bash";
  args = [ ./bin/install.sh ];
  src = ./nvim;
  system = builtins.currentSystem;
}
# stdenv.mkDerivation {
#   name = "neovim"
# }
