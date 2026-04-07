{ options, ... }:

{
  networking = {
    hostName = "marcin-jamroz"; # Define your hostname.

    timeServers = options.networking.timeServers.default ++ [ "pool.ntp.org" ];

    networkmanager = {
      enable = true;
      dns = "none";
      insertNameservers = [
        "127.0.0.1"
        "::1"
      ];
    };

    nameservers = [
      "127.0.0.1"
      "::1"
    ];
  };

  services.dnscrypt-proxy = {
    enable = true;
    settings = {
      server_names = [
        "cloudflare"
        # "google"
        # "quad9"
      ];
      doh_servers = true;
      listen_addresses = [
        "127.0.0.1:53"
        "[::1]:53"
      ];
      query_log.file = "/var/log/dnscrypt-proxy/query.log";
    };
  };
}
