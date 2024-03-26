{ pkgs, ... }:
{
  programs.neovim = {
    enable = true;
    viAlias = true;
    vimAlias = true;
    vimdiffAlias = true;
    defaultEditor = true;

    extraLuaConfig = ''
      require("config.lazy")
    '';

    extraPackages = [
      pkgs.gcc
      pkgs.lazygit
    ];
  };

  xdg.configFile."nvim/lua".source = ./neovim/lua;
}
