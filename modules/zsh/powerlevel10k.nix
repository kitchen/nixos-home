{ lib, pkgs, ... }:
{
  home.packages = [
    pkgs.zsh-powerlevel10k
  ];

  programs.zsh.plugins = [
    {
      name ="powerlevel10k";
      src = pkgs.zsh-powerlevel10k;
      file = "share/zsh-powerlevel10k/powerlevel10k.zsh-theme";
    }
    {
      name = "powerlevel10k-config";
      src = lib.cleanSource ./powerlevel10k;
      file = "p10k.zsh";
    }
  ];
}

