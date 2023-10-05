{
  description = "Host specific variables for my nixos config.";

  outputs = { ... }: rec {
    host = "host";
    nixosModules = rec {
      setupConfig = import ./module.nix { host };
      default = setupConfig;
    };
  };
}