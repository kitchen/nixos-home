{ pkgs, ... }:
{
  programs.zoxide = {
    enable = true;
    # to be replaced with oh-my-zsh plugin config option when omz upgrades
    options = [
      "--cmd cd"
    ];
  };

  programs.zsh = {
    oh-my-zsh = {
      plugins = [ "zoxide" ];
      extraConfig = "export ZOXIDE_CMD_OVERRIDE=cd";
    };
  };
}
