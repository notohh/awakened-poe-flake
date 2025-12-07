{

  lib,
  fetchurl,
  appimageTools,
  ...
}:

#TODO add desktop entry etc

appimageTools.wrapType2 rec {
  pname = "exiled-exchange-2";
  version = "0.12.8";
  src = fetchurl {
    url = "https://github.com/Kvan7/Exiled-Exchange-2/releases/download/v${version}/Exiled-Exchange-2-${version}.AppImage";
    hash = "sha256-hGUmwyhFsM+8XTrFCuaLVYAA85jwrKCftkQ/wlViRHI=";
  };

  meta = with lib; {
    description = "Path of Exile 2 trading app for price checking";
    mainProgram = "exiled-exchange-2";
    homepage = "https://github.com/Kvan7/Exiled-Exchange-2";
    license = licenses.mit;
    maintainers = with maintainers; [ notohh ];
  };
}
