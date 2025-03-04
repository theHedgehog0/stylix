{ config, lib, ... }:

{
  options.stylix.targets.lightdm.enable =
    config.stylix.mkEnableTarget "LightDM" true;

  config.services.xserver.displayManager.lightdm.background =
    lib.mkIf config.stylix.targets.lightdm.enable config.stylix.image;
}
