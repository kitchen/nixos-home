{ pkgs, ... }:
{
  programs.thefuck.enable = true;
  programs.zsh.oh-my-zsh.plugins = [ "thefuck" ];
}
