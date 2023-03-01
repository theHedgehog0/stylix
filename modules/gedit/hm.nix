{ pkgs, config, lib, ... }:

let
  style = config.stylix.colors {
    template = builtins.readFile ./template.mustache;
    extension = "xml";
  };

in {
  options.stylix.targets.gedit.enable =
    config.stylix.mkEnableTarget "GEdit" true;

  config = lib.mkIf config.stylix.targets.gedit.enable {
    xdg.dataFile = {
      "gedit/styles/stylix.xml".source = style;
    };
  };
}
