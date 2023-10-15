{
  inputs = {
    flake-utils.url = "github:numtide/flake-utils";

    developers-urbit-org = {
      url = "github:urbit/developers.urbit.org";
      flake = false;
    };
  };

  outputs = { nixpkgs, flake-utils, developers-urbit-org, ... }:
    flake-utils.lib.eachDefaultSystem (system:
      let
        pkgs = nixpkgs.legacyPackages.${system};
      in {
        packages = {
          # copy the raw markdown files files from the input repo
          dump-runes = pkgs.writeShellScriptBin "dump-runes" ''
            ${pkgs.ruby}/bin/ruby dump-runes.rb ${developers-urbit-org} ./runes/
          '';
        };
      });
}
