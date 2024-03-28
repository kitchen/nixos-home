{ pkgs, ... }:
{
  programs.ssh = {
    enable = true;

    matchBlocks = {
      # github
      github = {
        hostname = "github.com";
        user = "git";
      };
      
      # laptop
      taipei = {
        hostname = "taipei.kitchen.io";
      };

      # 500gb/8GB crucial thinkcentre, ubuntu shell box but mostly home server now
      okoppe = {
        hostname = "okoppe.kitchen.io";
      };

      # 1TB/8gb thinkcentre, my nixos shell box
      biei = {
        hostname = "biei.kitchen.io";
      };

      # 512/8gb WD thinkcentre probably going to end up becoming nixos home server to replace okoppe
      furano = {
        hostname = "furano.kitchen.io";
      };

      # 512/8gb WD thinkcentre no use for this yet, maybe a "data lake" since akan is a lake. hah no.
      akan = {
        hostname = "akan.kitchen.io";
      };

      # the nuc
      shihoro = {
        hostname = "shihoro.kitchen.io";
      };

      # cisco 2960 switch. not on tailnet because old.
      chitose = {
        hostname = "chitose.kitchen.io";
        proxyJump = "biei.kitchen.io"; # once furano is up and running this might get replaced
      };
    };
  };
}
