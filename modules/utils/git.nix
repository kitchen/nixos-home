{ pkgs, ... }:

{
  home.packages = [
    pkgs.hub
  ];

  programs.git = {
    enable = true;
    userName = "Jeremy Kitchen";
    userEmail = "kitchen@kitchen.io";
    extraConfig.init.defaultBranch = "main";
    ignores = [
      ".DS_Store"
    ];


  };

  programs.zsh.oh-my-zsh.plugins = [
    "git"
    "github"
    "gitfast"
  ];

}
