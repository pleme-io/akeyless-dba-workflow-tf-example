{
  description = "Akeyless DBA workflow Terraform example — provisions MongoDB Atlas dynamic secrets with team-scoped RBAC via Akeyless roles and auth methods";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-25.11";
    substrate = {
      url = "github:pleme-io/substrate";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = { self, nixpkgs, substrate, flake-utils }:
    flake-utils.lib.eachDefaultSystem (system: let
      pkgs = import nixpkgs { inherit system; };
      mkTerraformModuleCheck = (import "${substrate}/lib/terraform-module.nix").mkTerraformModuleCheck;
    in {
      checks.default = mkTerraformModuleCheck pkgs {
        pname = "akeyless-dba-workflow-tf-example";
        version = "0.0.0-dev";
        src = self;
        description = "Akeyless DBA workflow Terraform example — provisions MongoDB Atlas dynamic secrets with team-scoped RBAC via Akeyless roles and auth methods";
        homepage = "https://github.com/pleme-io/akeyless-dba-workflow-tf-example";
      };

      devShells.default = pkgs.mkShellNoCC {
        packages = with pkgs; [
          opentofu
          tflint
          terraform-docs
        ];
      };
    });
}
