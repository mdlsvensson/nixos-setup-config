{ config, ... }: 
let
  cfg = config.setupConfig;
in rec {
  options.setupConfig = {
    host = mkOption {
      type = types.addCheck types.str (str: str == "desktop" || str == "laptop" || str == "server");
      example = "desktop";
      description = "The configuration to apply.";
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
}
