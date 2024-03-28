# just some fun packages that don't need their own entire module
{ pkgs, ...}:
{
  home.packages = [
    pkgs.angband
    pkgs.cmatrix
    pkgs.doge
    pkgs.figlet
    pkgs.neo-cowsay
    pkgs.rogue
    pkgs.sl
  ];
}
