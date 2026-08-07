{
  description = "My first flake!";

  inputs = {
    # nixpkgs.url = "github:NixOS/nixpkgs/nixos-26.05";
    # or
    nixpkgs.url = "github:nixpkgs/nixos-26.05";
    hyprland.url = "github:hyprwm/Hyprland";

    # use the following for unstable:
    # nixpkgs.url = "nixpkgs/nixos-unstable";

    # or any branch you want:
    # nixpkgs.url = "nixpkgs/{BRANCH-NAME}";
  };

  outputs = { self, nixpkgs, ... }:
    let
      lib = nixpkgs.lib;
    in {
      nixosConfigurations = {
        ODEN = lib.nixosSystem {
          system = "x86_64-linux";
          modules = [ ./configuration.nix ];
      };
    };
  };
}
