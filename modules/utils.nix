{ pkgs, ... }:
{
  # these have more configuration
  imports = [
    ./utils/aws.nix
    ./utils/btop.nix
    ./utils/git.nix
    ./utils/lsd.nix
    ./utils/ripgrep.nix
    ./utils/thefuck.nix
  ];

  home.packages = [
    pkgs.dig
    pkgs.fd
    pkgs.lftp
    pkgs.neofetch
    pkgs.tio
    pkgs.wget
    pkgs.whois
  ];

  programs.jq.enable = true;
}
