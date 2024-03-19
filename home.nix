{ lib, config, pkgs, ... }:

{
  # Home Manager needs a bit of information about you and the paths it should
  # manage.
  home.username = "kitchen";
  home.homeDirectory = "/home/kitchen";

  # This value determines the Home Manager release that your configuration is
  # compatible with. This helps avoid breakage when a new Home Manager release
  # introduces backwards incompatible changes.
  #
  # You should not change this value, even if you update Home Manager. If you do
  # want to update the value, then make sure to first check the Home Manager
  # release notes.
  home.stateVersion = "23.11"; # Please read the comment before changing.

  nixpkgs.config.allowUnfree = true;

  home.packages = [
    pkgs.fd
    pkgs.hub
    pkgs.zsh-powerlevel10k
    pkgs.terraform
  ];

  # Home Manager is pretty good at managing dotfiles. The primary way to manage
  # plain files is through 'home.file'.
  home.file = {
    # # Building this configuration will create a copy of 'dotfiles/screenrc' in
    # # the Nix store. Activating the configuration will then make '~/.screenrc' a
    # # symlink to the Nix store copy.
    # ".screenrc".source = dotfiles/screenrc;

    # # You can also set the file content immediately.
    # ".gradle/gradle.properties".text = ''
    #   org.gradle.console=verbose
    #   org.gradle.daemon.idletimeout=3600000
    # '';
  };

  # Home Manager can also manage your environment variables through
  # 'home.sessionVariables'. If you don't want to manage your shell through Home
  # Manager then you have to manually source 'hm-session-vars.sh' located at
  # either
  #
  #  ~/.nix-profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  /etc/profiles/per-user/kitchen/etc/profile.d/hm-session-vars.sh
  #
  home.sessionVariables = {
    EDITOR = "nvim";
  };

  programs.btop.enable = true;

  programs.fzf.enable = true;

  programs.git = {
    enable = true;
    userName = "Jeremy Kitchen";
    userEmail = "kitchen@kitchen.io";
    extraConfig = {
      init = {
        defaultBranch = "main";
      };
    };
  };

  programs.go.enable = true;
  programs.home-manager.enable = true;

  programs.lsd = {
    enable = true;
    enableAliases = true;
  };

  programs.neovim = {
    enable = true;
    viAlias = true;
    vimAlias = true;
    vimdiffAlias = true;
    defaultEditor = true;
  };

  programs.ripgrep.enable = true;
  programs.thefuck.enable = true;
  programs.tmux.enable = true;

  programs.zoxide = {
    enable = true;
    # to be replaced with oh-my-zsh plugin config option when omz upgrades
    options = [
      "--cmd cd"
    ];
  };


  programs.zsh = {
    enable = true;

    oh-my-zsh = {
      enable = true;
      plugins = [
	"aws"
	"fzf"
        "git"
	"github"
	"gitfast"
	"golang"
	"ripgrep"
	"thefuck"
	"zoxide"
        # TODO: zsh-syntax-highlighting
      ];
      # this option is only from a newer version of zoxide oh-my-zsh plugin
      extraConfig = "export ZOXIDE_CMD_OVERRIDE=cd";
    };

    plugins = [
      {
        name = "powerlevel10k";
	src = pkgs.zsh-powerlevel10k;
	file = "share/zsh-powerlevel10k/powerlevel10k.zsh-theme";
      }
      {
        name = "powerlevel10k-config";
	src = lib.cleanSource ./p10k-config;
	file = "p10k.zsh";
      }
    ];

    syntaxHighlighting.enable = true;
  };
  
}
