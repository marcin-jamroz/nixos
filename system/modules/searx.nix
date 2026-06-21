{ username, ... }:
{
  services.searx = {
    enable = true;
    redisCreateLocally = true;
    environmentFile = "/home/${username}/.config/searxng/searxng.env";
    settings = {
      server = {
        port = "8888";
        bind_address = "127.0.0.1";
        image_proxy = true;
      };

      ui = {
        static_use_hash = true;
        default_theme = "simple";
        default_locale = "en";
        query_in_title = true;
      };

      search = {
        safe_search = 0;
        autocomplete = "duckduckgo";
      };
    };
  };
}
