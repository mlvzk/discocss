{ config, lib, pkgs, ... }:
with lib;
let
  cfg = config.programs.discocss;
in
{
  options = {
    programs.discocss = {
      enable = mkEnableOption "discocss";

      package = mkOption {
        type = types.package;
        default = pkgs.callPackage ./. { };
      };

      discord = mkOption {
        type = types.package;
        default = pkgs.discord;
      };

      discordAlias = mkOption {
        type = types.bool;
        default = true;
      };

      css = mkOption {
        type = types.str;
        default = "";
      };
    };
  };

  config = mkIf cfg.enable {
    assertions = [{
      assertion = cfg.discordAlias -> !(builtins.any (p: p.name == cfg.discord.name) config.home.packages);
      message = "To use discocss with discordAlias you have to remove discord from home.packages, or set discordAlias = false;";
    }];

    home.packages = [
      (cfg.package.override {
        discordAlias = cfg.discordAlias;
        discord = cfg.discord;
      })
    ];

    xdg.configFile."discocss/custom.css".text = cfg.css;
  };
}
