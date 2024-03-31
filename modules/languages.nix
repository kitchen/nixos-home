{ pkgs, ... }:
{
  # many/most of these don't have extra config but I want to leave room for them to later
  imports = [
    ./languages/golang.nix
    ./languages/nodejs.nix
    ./languages/rust.nix
    ./languages/terraform.nix
  ];
}
