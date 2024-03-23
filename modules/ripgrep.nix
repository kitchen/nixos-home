{ pkgs, ... }:

{
  programs.ripgrep.enable = true;
  programs.zsh.oh-my-zsh.plugins = [ "ripgrep" ];
}
