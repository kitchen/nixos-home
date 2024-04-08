{ environment, config, pkgs, ... }:
{
  environment.systemPackages = with pkgs; [ 
    transmission
  ];

  services.transmission = {
    enable = true;
    settings = {
      # manually mount the device then use `nixos-generate-config` to update the hardware-configuration.nix file
      # download-dir = "/mnt/itoigawa/torrents";;

      # require encrypted peers
      encryption = 2;

      # I thought I had this set to 250mbit, not 25, but whatever, I don't think I ever come anywhere near even 25mbit.
      speed-limit-up = "25000";
    };
  };

  services.plex = {
    enable = true;
    openFirewall = false;
  };

  services.nginx = {
    enable = true;

    # treasure.kitchen.horse is a CNAME managed in netlify
    virtualHosts."treasure.kitchen.horse" = {
      locations."/" = {
        proxyPass = "http://localhost:9091/";
      };
    };

    # plex.kitchen.horse is a CNAME managed in netlify
    virtualHosts."plex.kitchen.horse" = {
      locations."/" = {
        proxyPass = "http://plex.kitchen.horse:32400/";
      };
    };
  };
}
