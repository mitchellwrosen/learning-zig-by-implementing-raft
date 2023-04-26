{
  description = "learning zig by implementing raft";

  inputs = {
    nixpkgs = {
      url = "github:NixOS/nixpkgs/8bac227a5a27ba29240e496e3e3fd55a2351f68b";
    };
  };

  outputs = { self, nixpkgs }:
    {
      devShell = {
        x86_64-darwin =
          nixpkgs.legacyPackages.x86_64-darwin.mkShell {
            buildInputs = [
              nixpkgs.legacyPackages.x86_64-darwin.zig
              nixpkgs.legacyPackages.x86_64-darwin.zls
            ];
          };
        x86_64-linux =
          nixpkgs.legacyPackages.x86_64-linux.mkShell {
            buildInputs = [
              nixpkgs.legacyPackages.x86_64-linux.zig
              nixpkgs.legacyPackages.x86_64-linux.zls
            ];
          };
      };
    };
}
