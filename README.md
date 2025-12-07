<div align="center">
<h1>awakened-poe-flake</h1>
<p></p>
  <img src="https://files.catbox.moe/qvu235.png">
 <p></p>
</div>

### what is this?

this repo is a little flake i wrote for myself to automatically wrap and install [apt](https://snosme.github.io/awakened-poe-trade/download)
and [ee2](https://exiledexchange2.com/#about). i hope you appreciate my custom drawn image

### how do i use it?

#### using flakes
add the flake to your inputs like so
```nix
{
  description = "my awesome flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
    awakened-poe-flake.url = "git+https://git.flake.sh/notohh/awakened-poe-flake";
  };

  outputs = { self, nixpkgs }@inputs: {
    nixosConfigurations.<hostname> = nixpkgs.lib.nixosSystem {
      specialArgs = {inherit inputs;};
      modules = [
        ./configuration.nix
        # ...
      ];
    };
  };
}
```
then call the package

```nix
  # home.packages for home-manager
  environment.systemPackages = [
    inputs.awakened-poe-flake.packages.${pkgs.stdenv.hostPlatform.system}.<package> 
    # <package> being either awakened-poe-trade or exiled-exchange-2
  ];
```


