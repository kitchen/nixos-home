{ pkgs, ... }:
{
  programs.ssh = {
    enable = true;

    matchBlocks = {
      # 512/8gb WD thinkcentre probably going to become a kube node
      akan = {
        hostname = "akan.kitchen.io";
      };

      # 256GB/8gb kingston thinkcentre, probably going to become a kube node
      biei = {
        hostname = "biei.kitchen.io";
      };

      # cisco 2960 switch. not on tailnet because old.
      chitose = {
        hostname = "chitose.kitchen.io";
        proxyJump = "biei.kitchen.io"; # once furano is up and running this might get replaced
      };

      # 512/8gb WD thinkcentre probably going to become a kube node
      furano = {
        hostname = "furano.kitchen.io";
      };

      # 500gb/8GB crucial thinkcentre, currently media server will likely become kube node
      okoppe = {
        hostname = "okoppe.kitchen.io";
      };

      # pihole
      shari = {
        hostname = "shari.kitchen.io";
      };

      shihoro = {
        hostname = "shihoro.kitchen.io";
      };

      # laptop
      taipei = {
        hostname = "taipei.kitchen.io";
      };
    };
  };
}
