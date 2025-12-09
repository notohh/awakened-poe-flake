{

  lib,
  fetchurl,
  appimageTools,
  ...
}:

#TODO add desktop entry etc

appimageTools.wrapType2 rec {
  pname = "awakened-poe-trade";
  version = "3.27.106";
  src = fetchurl {
    url = "https://github.com/SnosMe/awakened-poe-trade/releases/download/v${version}/Awakened-PoE-Trade-${version}.AppImage";
    hash = "sha256-8L5Szn0KYfUMaTe+yyhJV1YZspmJCSlXSHXLPoiRhjE=";
  };

  meta = with lib; {
    description = "💲 🔨 Path of Exile app for price checking";
    mainProgram = "awakened-poe-trade";
    homepage = "https://github.com/SnosMe/awakened-poe-trade";
    license = licenses.mit;
    maintainers = with maintainers; [ notohh ];
  };
}
