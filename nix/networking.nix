{ pkgs, lib, ... }:
let
  openScript = pkgs.writeShellScriptBin "open-browser" ''
    uid=1000
    user=brayden

    export XDG_RUNTIME_DIR="/run/user/$uid"
    export DBUS_SESSION_BUS_ADDRESS="unix:path=$XDG_RUNTIME_DIR/bus"

    ${pkgs.util-linux}/bin/runuser -u "$user" -- \
      ${pkgs.systemd}/bin/systemd-run --user \
        --collect \
        --unit=openconnect-browser \
        ${pkgs.xdg-utils}/bin/xdg-open "$1"
  '';
in
{
  hardware.wirelessRegulatoryDatabase = true;

  boot.extraModprobeConfig = ''
    options cfg80211 ieee80211_regdom="US"
  '';

  networking = {
    wireless.iwd = {
      enable = true;
    };
    hostName = "braydens-laptop";
    openconnect.interfaces.openconnect0 = {
      gateway = "webvpn.purdue.edu";
      protocol = "anyconnect";
      user = "bzee";
      autoStart = false;
      extraOptions = {
        external-browser = "${openScript}/bin/open-browser";
      };
    };
    firewall = {
      enable = false;
      allowedTCPPorts = [ 53317 8765 ];
      allowedUDPPorts = [ 53317 8765 ];
    };
  };

  systemd.services.openconnect-openconnect0.serviceConfig.ProtectHome = lib.mkForce false;
}
