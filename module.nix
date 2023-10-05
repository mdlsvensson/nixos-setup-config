{ config, host, ... }: {
  config = {
    networking.hostName = host;
  };
}
