{ config, pkgs, ... }:
{
  programs.awscli = {
    enable = true;
    settings = {
      kitchen = {
        region = "us-west-2";
      };
    };
    credentials = { kitchen = { credential_process = "cat ${config.home.homeDirectory}/.aws/real_credentials_kitchen"; }; };
  };
}
