# Edit this configuration file to define what should be installed on
# your system. Help is available in the configuration.nix(5) man page, on
# https://search.nixos.org/options and in the NixOS manual (`nixos-help`).

{ config, options, lib, pkgs, inputs, ... }:
{
  imports = [ ./hardware-configuration.nix ];

  services.udev.packages = [ pkgs.openocd pkgs.teensy-udev-rules pkgs.librealsense ];

  services.udisks2.enable = true;

  programs.steam.enable = true;

  environment.systemPackages = with pkgs; [
    chromium
    localsend
    prismlauncher
    usbutils
    btop
  ];

  nix.settings.experimental-features = [ "nix-command" "flakes" ];
  nixpkgs.config.allowUnfree = true;

  security.pki.caCertificateBlacklist = [
  ];

  systemd.timers."hello-world" = {
    wantedBy = [ "timers.target" ];
    timerConfig = {
      OnCalendar = "*-*-* 14:30:00 America/New_York";
      Unit = "hello-world.service";
      WakeSystem = true;
    };
  };

  systemd.services."hello-world" = {
    script = ''
      set -eu
      ${pkgs.coreutils}/bin/echo "Hello World"
    '';
    serviceConfig = {
      Type = "oneshot";
      User = "root";
      RemainAfterExit = true; # Prevents the service from automatically starting on rebuild. See https://discourse.nixos.org/t/how-to-prevent-custom-systemd-service-from-restarting-on-nixos-rebuild-switch/43431
    };
  };

  # This option defines the first version of NixOS you have installed on this particular machine,
  # and is used to maintain compatibility with application data (e.g. databases) created on older NixOS versions.
  #
  # Most users should NEVER change this value after the initial install, for any reason,
  # even if you've upgraded your system to a new NixOS release.
  #
  # This value does NOT affect the Nixpkgs version your packages and OS are pulled from,
  # so changing it will NOT upgrade your system - see https://nixos.org/manual/nixos/stable/#sec-upgrading for how
  # to actually do that.
  #
  # This value being lower than the current NixOS release does NOT mean your system is
  # out of date, out of support, or vulnerable.
  #
  # Do NOT change this value unless you have manually inspected all the changes it would make to your configuration,
  # and migrated your data accordingly.
  #
  # For more information, see `man configuration.nix` or https://nixos.org/manual/nixos/stable/options#opt-system.stateVersion .
  system.stateVersion = "26.05"; # Did you read the comment?

}

