{inputs, ...}: {
  flake.cardanoLib = inputs.cardano-parts.inputs.iohk-nix.pkgs.cardanoLib;
}
