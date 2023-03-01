{pkgs, config, ... }:

{
  # Generate a PNG image containing a named color
  config = {
    stylix.pixel = color:
      pkgs.runCommand "${color}-pixel.png" {
        color = config.stylix.colors.withHashtag.${color};
      } "${pkgs.imagemagick}/bin/convert xc:$color png32:$out";
  };
}
