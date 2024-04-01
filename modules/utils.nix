{ pkgs, ... }:
{
  # these have more configuration
  imports = [
    ./utils/aws.nix
    ./utils/btop.nix
    ./utils/git.nix
    ./utils/jq.nix
    ./utils/lsd.nix
    ./utils/ripgrep.nix
    ./utils/thefuck.nix
  ];

  home.packages = [
    pkgs.fd
    pkgs.neofetch
  ];

  programs.jq.enable = true;
}
