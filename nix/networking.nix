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
      passwordFile = "/var/lib/secrets/openconnect-passwd";
      autoStart = false;
    };
    firewall = {
      allowedTCPPorts = [ 53317 ];
      allowedUDPPorts = [ 53317 ];
    };
  };
}
