{ pkgs, ... }:
{
  # TODO maybe somehow make a dependency on the aws module for this?
  home.packages = [
    pkgs.terraform
  ];
  programs.zsh.oh-my-zsh.plugins = [ "aws" ];
}
