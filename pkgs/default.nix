{ inputs, ... }:
{
  imports = [ inputs.flake-parts.flakeModules.easyOverlay ];

  perSystem =
    { config, pkgs, ... }:
    {
      overlayAttrs = {
        inherit (config.packages)
          awakened-poe-trade
          exiled-exchange-2
          ;
      };

      packages = {
        awakened-poe-trade = pkgs.callPackage ./awakened-poe-trade.nix { };
        exiled-exchange-2 = pkgs.callPackage ./exiled-exchange-2.nix { };
      };
    };
}
