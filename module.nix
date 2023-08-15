{ config, ... }: 
let cfg = config.setupConfig;
in rec {
  options.setupConfig = {
    host = mkOption {
      type = types.addCheck types.str (str: str == "desktop" || str == "laptop" || str == "server");
      example = "desktop";
      description = "The configuration to apply.";
    };
    kernelModules = mkOption {
      type = types.listOf types.str;
      default = [ ];
      example = [ "amdgpu" ];
      description = "https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/boot/kernel.nix";
    };
    initrd.kernelModules = mkOption {
      type = types.listOf types.str;
      default = [ ];
      example = [ "amdgpu" ];
      description = "https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/system/boot/kernel.nix";
    };
    xserver.videoDrivers = mkOption {
      type = types.listOf types.str;
      default = [ ];
      example = [ "nvidia" ];
      description = "Tell Xorg what video drivers to use.";
    };
    user = {
      username = mkOption {
        type = types.str;
        example = "myUsername";
        description = "Login username.";
      };
      homeDirectory = mkOption {
        type = types.path;
        example = /home/myUsername;
        description = "Path to the user home directory.";
      };
    };
    git = {
      userName = mkOption {
        type = types.str;
        example = "myGitUsername";
        description = "The git username setting.";
      };
      userEmail = mkOption {
        type = types.str;
        example = "myGitEmail@gmail.com";
        description = "The git email setting.";
      };
    };
  };

  config = {
    boot.kernelModules = cfg.kernelModules;
    boot.initrd.kernelModules = cfg.initrd.kernelModules;
    services.xserver.videoDrivers = cfg.xserver.videoDrivers;
  };
}
