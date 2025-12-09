{

  lib,
  fetchurl,
  appimageTools,
  makeDesktopItem,
  ...
}:
let
  pname = "awakened-poe-trade";
  version = "3.27.106";
  icon = fetchurl {
    url = "https://web.poecdn.com/image/Art/2DItems/Currency/TransferOrb.png";
    sha256 = "sha256-DR6kzgwNefz4Va11QNP2GuieQss6OW6q74GBDwOUaD0=";
  };

  desktopItem = makeDesktopItem {
    desktopName = "Awakened PoE Trade";
    name = pname;
    exec = pname;
    icon = icon;
  };
in

appimageTools.wrapType2 {
  inherit pname version;
  src = fetchurl {
    url = "https://github.com/SnosMe/awakened-poe-trade/releases/download/v${version}/Awakened-PoE-Trade-${version}.AppImage";
    hash = "sha256-8L5Szn0KYfUMaTe+yyhJV1YZspmJCSlXSHXLPoiRhjE=";
  };

  extraInstallCommands = ''
    mkdir -p $out/share/applications
    ln -s ${desktopItem}/share/applications/* $out/share/applications/
  '';

  meta = with lib; {
    description = "💲 🔨 Path of Exile app for price checking";
    mainProgram = "awakened-poe-trade";
    homepage = "https://github.com/SnosMe/awakened-poe-trade";
    license = licenses.mit;
    maintainers = with maintainers; [ notohh ];
  };
}
