{
  perSystem = {config, ...}: {
    cardano-parts.shell.global.defaultShell = "test";
    cardano-parts.shell.global.enableVars = false;
    cardano-parts.shell.test.extraPkgs = with config.packages; [run-cardano-node jormungandr voting-tools voter-registration catalyst-toolbox];
  };
}
