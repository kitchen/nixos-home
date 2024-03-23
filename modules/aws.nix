{ pkgs, ... }:
{
  programs.awscli = {
    enable = true;
    settings = {
      kitchen = {
        region = "us-west-2";
      };
    };
  };
}
