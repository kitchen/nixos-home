# for settings very specific to *me* that I want on every machine
{ config, pkgs, ... }:
{
  # Configure keymap in X11
  services.xserver = {
    layout = "us";
    xkbVariant = "dvorak";
  };

  # Configure console keymap
  console.keyMap = "dvorak";

  # Define a user account. Don't forget to set a password with ‘passwd’.
  programs.zsh.enable = true;
  users.users.kitchen = {
    isNormalUser = true;
    description = "Jeremy Kitchen";
    extraGroups = [ "networkmanager" "wheel" "docker" ];
    packages = with pkgs; [];
    shell = pkgs.zsh;
    openssh.authorizedKeys.keys = [
      # taipei ed25519 key
      "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIK20Mz6/MC7C9IRr5YrIwH34o2A7cUppyFMLT3k5jh9f kitchen@taipei.kitchen.io"
      # taipei ecdsa key
      "ecdsa-sha2-nistp256 AAAAE2VjZHNhLXNoYTItbmlzdHAyNTYAAAAIbmlzdHAyNTYAAABBBPP1SUY0xXafvoWwDuNbNqq4ut09OMGFLBkzWdgxFCCG3lfVVSDnJYG1R4WgLMhESCQkEE8K+n1LnH8AJg0n25k= kitchen@taipei.kitchen.io"
      # shihoro
      "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAILmG1/Bs2oKqYa9UNYisZT+armcZzQRsa1mUziAp+Dsh kitchen@shihoro"
      # biei
      "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIB36Wvae6AQvC3s/X6RuNoC/2mGV2b+gFxmdEDX54YCK kitchen@biei"
    ];
  };
}
