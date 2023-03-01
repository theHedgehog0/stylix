{ pkgs, config, lib, ... }:

{
  options.stylix.targets.fish.enable =
    config.stylix.mkEnableTarget "Fish" true;

  config = lib.mkIf config.stylix.targets.fish.enable {
    programs.fish.interactiveShellInit = import ./prompt.nix { inherit pkgs config; };
  };
}
