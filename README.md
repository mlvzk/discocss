# DiscoCSS

A tiny Discord css-injector.

# Installation

```sh
git clone https://github.com/mlvzk/discocss
cp discocss/discocss /usr/bin # or any other directory in your $PATH
```

If you use Arch Linux, there's an unofficial AUR package available: [discocss-git](https://aur.archlinux.org/packages/discocss-git/)

## NixOS with flakes

```diff
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs";
+   discocss.url = "github:mlvzk/discocss";
+   discocss.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = {
    self,
    nixpkgs,
    home-manager,
+   discocss,
    ...,
  }: {
        {
          home-manager.useGlobalPkgs = true;
          home-manager.useUserPackages = true;
+         home-manager.sharedModules = [ discocss.hmModule ];
          home-manager.users.mlvzk = import ./home.nix;
        }
      ];
```

# Usage

Put your css in `~/.config/discocss/custom.css`

Run `discocss`

## Usage with Home Manager on NixOS

```nix
programs.discocss = {
  enable = true;
  # You can override the discord package discocss uses
  discord = pkgs.discord.overrideAttrs (old: { ... });
  # Set to false if you don't want your Discord binary to be aliased to discocss
  discordAlias = true;
  css = ''
    div {
      background: red;
    }
  '';
};
```

# Notes

If after an update your theme doesn't work anymore, close and run `discocss` again. Discord might be running in the background without you knowing, so if it still doesn't work, use `pkill`.
