{ pkgs, ... }:
let
  rose-pine-theme = pkgs.tmuxPlugins.mkTmuxPlugin {
    pluginName = "rose-pine";
    rtpFilePath = "rose-pine.tmux";

    version = "unstable-2024-03-22";
    src = pkgs.fetchFromGitHub {
      owner = "rose-pine";
      repo = "tmux";
      rev = "23233037e48ea5f124b6186f8d232fda03326448"; # latest main commit as of 2024-03-22
      sha256 = "sha256-0ccJVQIIOpHdr3xMIBC1wbgsARCNpmN+xMYVO6eu/SI="; # got this from the error message when trying to build
    };
  };
in
{
  programs.tmux = {
    enable = true;
    terminal = "tmux-256color";
    historyLimit = 100000;
    plugins = with pkgs;
      [
	{
	  plugin = rose-pine-theme;
	  extraConfig = ''
	    set -g @rose_pine_variant 'main'
	    set -g @rose_pine_host 'on'
	  '';
	}
      ];
    baseIndex = 1;
    extraConfig = ''
      # window splits
      bind-key | split-window -h
      bind-key _ split-window -v
      
      # vim-like moving between panes
      bind-key h select-pane -L
      bind-key j select-pane -D
      bind-key k select-pane -U
      bind-key l select-pane -R
      
      # because sometimes I don't let go of ctrl before I hit d and it's annoying
      bind-key C-d detach-client
      
      set-option -g set-titles on
      set-option -g set-titles-string "#S / #H"

      set -g status-position top
    '';
  };
}

