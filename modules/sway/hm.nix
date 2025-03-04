{ config, lib, ... }:

with config.stylix.colors.withHashtag;

let
  text = base05;
  urgent = base08;
  focused = base0A;
  unfocused = base03;

  fonts = {
    names = [ config.stylix.fonts.sansSerif.name ];
    size = 8.0;
  };

in {
  options.stylix.targets.sway.enable =
    config.stylix.mkEnableTarget "Sway" true;

  config = lib.mkMerge [
    (lib.mkIf config.stylix.targets.sway.enable {
      wayland.windowManager.sway.config = {
        inherit fonts;

        colors = let
          background = base00;
          indicator = base0B;
        in {
          inherit background;
          urgent = {
            inherit background indicator text;
            border = urgent;
            childBorder = urgent;
          };
          focused = {
            inherit background indicator text;
            border = focused;
            childBorder = focused;
          };
          focusedInactive = {
            inherit background indicator text;
            border = unfocused;
            childBorder = unfocused;
          };
          unfocused = {
            inherit background indicator text;
            border = unfocused;
            childBorder = unfocused;
          };
          placeholder = {
            inherit background indicator text;
            border = unfocused;
            childBorder = unfocused;
          };
        };

        output."*".bg = "${config.stylix.image} fill";
      };
    })

    {
      # Merge this with your bar configuration using //config.stylix.sway.bar
      lib.stylix.sway.bar = {
        inherit fonts;

        colors = let
          background = base01;
          border = background;
        in {
          inherit background;
          statusline = text;
          separator = base03;
          focusedWorkspace = {
            inherit text border;
            background = focused;
          };
          activeWorkspace = {
            inherit text border;
            background = unfocused;
          };
          inactiveWorkspace = {
            inherit text border;
            background = unfocused;
          };
          urgentWorkspace = {
            inherit text border;
            background = urgent;
          };
          bindingMode = {
            inherit text border;
            background = urgent;
          };
        };
      };
    }
  ];
}
