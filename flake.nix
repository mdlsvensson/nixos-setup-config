{
  description = "NixOS module for defining local configuration data.";

  outputs = { ... }: {
    nixosModules = rec {
      setupConfig = import ./module.nix;
      default = setupConfig;
    };
  };
}