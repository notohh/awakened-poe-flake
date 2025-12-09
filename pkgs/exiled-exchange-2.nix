{

  lib,
  fetchurl,
  appimageTools,
  makeDesktopItem,
  ...
}:
let
  pname = "exiled-exchange-2";
  version = "0.12.8";
  icon = fetchurl {
    url = "https://github.com/Kvan7/Exiled-Exchange-2/raw/master/renderer/public/images/jeweler.png";
    sha256 = "sha256-30GXskIwOQ4m1a6dcm7MXVwlHsYvQ+SnavEGTKHqHUo=";
  };

  desktopItem = makeDesktopItem {
    desktopName = "Exiled Exchange 2";
    name = pname;
    exec = pname;
    icon = icon;
  };
in

appimageTools.wrapType2 {
  inherit pname version;
  src = fetchurl {
    url = "https://github.com/Kvan7/Exiled-Exchange-2/releases/download/v${version}/Exiled-Exchange-2-${version}.AppImage";
    hash = "sha256-hGUmwyhFsM+8XTrFCuaLVYAA85jwrKCftkQ/wlViRHI=";
  };

  extraInstallCommands = ''
    mkdir -p $out/share/applications
    ln -s ${desktopItem}/share/applications/* $out/share/applications/
  '';

  meta = with lib; {
    description = "Path of Exile 2 trading app for price checking";
    mainProgram = "exiled-exchange-2";
    homepage = "https://github.com/Kvan7/Exiled-Exchange-2";
    license = licenses.mit;
    maintainers = with maintainers; [ notohh ];
  };
}
