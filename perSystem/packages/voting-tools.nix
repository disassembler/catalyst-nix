{
  perSystem = {
    pkgs,
    inputs',
    ...
  }: let
    jormungandr-src = pkgs.fetchurl {
      url = "https://github.com/input-output-hk/jormungandr/releases/download/v0.9.3/jormungandr-0.9.3-x86_64-unknown-linux-musl-generic.tar.gz";
      sha256 = "sha256:14giz9yz94mdjrdr96rz5xsj21aacdw8mqrfdz031czh4qgnmnzh";
    };
    jormungandr = pkgs.runCommand "jormungandr" {buildInputs = [pkgs.gnutar];} ''
      mkdir -p $out/bin
      cd $out/bin
      tar -zxvf ${jormungandr-src}
    '';
  in {
    packages.voting-tools = inputs'.voting-tools.legacyPackages.voting-tools;
    packages.catalyst-toolbox = inputs'.catalyst-toolbox.packages.catalyst-toolbox;
    packages.voter-registration = inputs'.voting-tools.legacyPackages.voter-registration;
    packages.jormungandr = jormungandr;
  };
}
