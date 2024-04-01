{ config, lib, pkgs, ... }:
{
  # TODO: firewall configuration
  # basically what I want here is everything external is just banned, but anything coming in via tailscale is fine.
  #
  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;
  networking.firewall = {
    enable = true;

    trustedInterfaces = [ "tailscale0" ];
  };

  services.openssh = {
    enable = true;
    openFirewall = false;
    settings = {
      PermitRootLogin = "no";
      PasswordAuthentication = false;
    };
  };

  security.sudo.wheelNeedsPassword = false;

  services.tailscale.enable = true;
}

