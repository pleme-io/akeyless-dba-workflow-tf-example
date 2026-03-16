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

  outputs = inputs:
    (import "${inputs.substrate}/lib/repo-flake.nix" {
      inherit (inputs) nixpkgs flake-utils;
    }) {
      self = inputs.self;
      language = "terraform";
      builder = "check";
      pname = "akeyless-dba-workflow-tf-example";
      description = "Akeyless DBA workflow Terraform example — provisions MongoDB Atlas dynamic secrets with team-scoped RBAC via Akeyless roles and auth methods";
    };
}
