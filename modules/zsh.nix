{ pkgs, ... }:

{
  # these have more configuration
  imports = [
    ./zsh/powerlevel10k.nix
    ./zsh/direnv.nix
    ./zsh/fzf.nix
    ./zsh/zoxide.nix
  ];

  programs.zsh = {
    enable = true;
    oh-my-zsh = {
      enable = true;
    };

    syntaxHighlighting.enable = true;
  };

  home.packages = [ pkgs.fd ];
}
