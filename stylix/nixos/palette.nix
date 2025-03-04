args:
{ config, ... }:

{
  imports = [ (import ../palette.nix args) ];

  config = {
    environment.etc = {
      # Making palette.json part of the system closure will protect it from
      # garbage collection, so future configurations can be evaluated without
      # having to generate the palette again. The generator is not kept, only
      # the palette which came from it, so this uses very little disk space.
      "stylix/palette.json".source = config.stylix.generated.json;

      # We also provide a HTML version which is useful for viewing the colors
      # during development.
      "stylix/palette.html".source = config.stylix.colors {
        template = builtins.readFile ../palette.html.mustache;
        extension = ".html";
      };
    };
  };
}
