{ lib, config, pkgs, ... }:

{
  
  # not sure I love these hardcoded things, doesn't seem all that portable, but ok
  home.username = "kitchen";
  home.homeDirectory = "/home/kitchen";

  home.stateVersion = "23.11";
  # probably figure out if I really need this and if I should be using allowUnfreePredicate instead
  # I definitely would love to limit the scope of possible unfree software getting installed by default
  # I just don't know if I need this at present, maybe for awscli or terraform? Dunno.
  nixpkgs.config.allowUnfree = true;
  programs.home-manager.enable = true;

  imports = [
    ./modules/direnv.nix
    ./modules/fun.nix
    ./modules/fzf.nix
    ./modules/golang.nix
    ./modules/neovim.nix
    ./modules/rust.nix
    ./modules/ssh.nix
    ./modules/terraform.nix
    ./modules/tmux.nix
    ./modules/utils.nix
    ./modules/zoxide.nix
    ./modules/zsh.nix
  ];

}
