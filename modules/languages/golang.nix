{ pkgs, ... }:
{
  programs.go.enable = true;
  programs.zsh.oh-my-zsh.plugins = [ "golang" ];
  home.sessionPath = [ "$HOME/go/bin" ];
}
