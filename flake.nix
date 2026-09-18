{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    systems.url = "github:nix-systems/default-linux";

    hyprutils = {
      url = "github:hyprwm/hyprutils";
      inputs.nixpkgs.follows = "nixpkgs";
      inputs.systems.follows = "systems";
    };

    hyprlang = {
      url = "github:hyprwm/hyprlang";
      inputs.nixpkgs.follows = "nixpkgs";
      inputs.systems.follows = "systems";
      inputs.hyprutils.follows = "hyprutils";
    };

    hyprgraphics = {
      url = "github:hyprwm/hyprgraphics";
      inputs.nixpkgs.follows = "nixpkgs";
      inputs.systems.follows = "systems";
      inputs.hyprutils.follows = "hyprutils";
    };

    aquamarine = {
      url = "github:hyprwm/aquamarine";
      inputs.nixpkgs.follows = "nixpkgs";
      inputs.systems.follows = "systems";
      inputs.hyprutils.follows = "hyprutils";
    };

    hyprwayland-scanner = {
      url = "github:hyprwm/hyprwayland-scanner";
      inputs = {
        nixpkgs.follows = "nixpkgs";
        systems.follows = "systems";
      };
    };

    hyprtoolkit = {
      url = "github:BlueZeeKing/hyprtoolkit";
      inputs.nixpkgs.follows = "nixpkgs";
      inputs.systems.follows = "systems";
      inputs.hyprutils.follows = "hyprutils";
      inputs.hyprlang.follows = "hyprlang";
      inputs.hyprgraphics.follows = "hyprgraphics";
      inputs.aquamarine.follows = "aquamarine";
      inputs.hyprwayland-scanner.follows = "hyprwayland-scanner";
    };

    hyprpolkitagent = {
      url = "github:hyprwm/hyprpolkitagent";
      inputs.nixpkgs.follows = "nixpkgs";
      inputs.systems.follows = "systems";
      inputs.hyprutils.follows = "hyprutils";
      inputs.hyprlang.follows = "hyprlang";
      inputs.hyprgraphics.follows = "hyprgraphics";
      inputs.aquamarine.follows = "aquamarine";
      inputs.hyprtoolkit.follows = "hyprtoolkit";
    };

    hyprlauncher = {
      url = "github:bluezeeking/hyprlauncher";
      inputs.nixpkgs.follows = "nixpkgs";
      inputs.systems.follows = "systems";
      inputs.hyprutils.follows = "hyprutils";
      inputs.hyprgraphics.follows = "hyprgraphics";
      inputs.aquamarine.follows = "aquamarine";
      inputs.hyprtoolkit.follows = "hyprtoolkit";
      inputs.hyprwayland-scanner.follows = "hyprwayland-scanner";
    };

    hyprland-guiutils = {
      url = "github:hyprwm/hyprland-guiutils";
      inputs.nixpkgs.follows = "nixpkgs";
      inputs.systems.follows = "systems";
      inputs.hyprutils.follows = "hyprutils";
      inputs.hyprlang.follows = "hyprlang";
      inputs.hyprgraphics.follows = "hyprgraphics";
      inputs.aquamarine.follows = "aquamarine";
      inputs.hyprtoolkit.follows = "hyprtoolkit";
      inputs.hyprwayland-scanner.follows = "hyprwayland-scanner";
    };
  };

  outputs = { self, nixpkgs, systems, ... } @ inputs:
  let
      inherit (nixpkgs) lib;
      eachSystem = lib.genAttrs (import systems);
      pkgsFor = eachSystem (
        system:
        import nixpkgs {
          localSystem.system = system;
          overlays = [
            self.overlays.default
          ];
        }
      );
  in
  {
    nixosConfigurations.braydens-laptop = nixpkgs.lib.nixosSystem {
      specialArgs = { inherit inputs; };
      modules = [
        ./nix/configuration.nix
	{
          nixpkgs.overlays = [
            self.overlays.default
          ];
	}
	{
          nix.registry = {
            nixpkgs.flake = nixpkgs;
          };
	}
      ];
    };

    devShells  = builtins.mapAttrs (system: pkgs:
      let
        luarc = pkgs.writeTextFile {
          name = ".luarc.json";
          text = builtins.toJSON {
            workspace = {
              library = [
                "${pkgs.hyprland}/share/hypr/stubs"
              ];
            };
          };
        };
      in {
      default = pkgs.mkShell {
        packages = [
          pkgs.lua-language-server
          pkgs.stylua
        ];
        shellHook = ''
          ln -sf ${luarc} ./hypr/dot-config/hypr/.luarc.json
        '';
      };
    }) inputs.nixpkgs.legacyPackages;

    overlays = {
      hyprlock = final: prev: {
        hyprlock = prev.hyprlock.overrideAttrs (final_attrs: prev_attrs: {
          patches =
            (prev_attrs.patches or [])
            ++
            [ (lib.filesystem.listFilesRecursive ./nix/patches/hyprlock) ];
        });
      };
      yazi = final: prev: {
        yazi-unwrapped = prev.yazi-unwrapped.overrideAttrs (final_attrs: prev_attrs: {
          postInstall = ''
            ${prev_attrs.postInstall}

            for r in 16 24 32 48 64 128 256 512; do
              install -Dm444 <(magick assets/logo.png -resize "''${r}x''${r}" -) "$out/share/icons/hicolor/''${r}x''${r}/apps/yazi.png"
            done
          '';
          nativeBuildInputs = prev_attrs.nativeBuildInputs ++ [ final.imagemagick ];
        });
      };
      slurp = final: prev: {
        slurp = prev.slurp.overrideAttrs (final_attrs: prev_attrs: {
          src = prev.fetchFromGitHub {
            owner = "emersion";
            repo = "slurp";
            rev = "a3998d3ec79fbd85b81911f43010466b032ed0d9";
            hash = "sha256-9f5Y4D8zB42cUdqilfHkkmZW6yTCaDosCjABLnp/EFI=";
          };
        });
      };
      material-symbols = final: prev: {
        material-symbols-rounded-filled = final.stdenv.mkDerivation {
          pname = "material-symbols-rounded-filled";
          version = final.material-symbols.version;
          src = final.fetchurl {
            url = "https://raw.githubusercontent.com/fonttools/fonttools/41af9f64813b77ac426ae5cbb5fd47dbbd630803/Snippets/rename-fonts.py";
            hash = "sha256-m/XSCNtvldKReV8Ecqwwedg9+Pr+9VA8vcca3Q1R4r0=";
          };
          nativeBuildInputs = [ final.material-symbols final.python314Packages.fonttools final.python314 final.installFonts ];

          unpackPhase = ''
            # do nothing
          '';

          buildPhase = ''
            fonttools varLib.instancer ${final.material-symbols}/share/fonts/truetype/MaterialSymbolsRounded\[FILL,GRAD,opsz,wght\].ttf -o MaterialSymbolsRoundedFilled\[GRAD,opsz,wght\].ttf FILL=1
            python3 $src -i -s " Filled" MaterialSymbolsRoundedFilled\[GRAD,opsz,wght\].ttf
          '';
        };
      };
      cursor = final: prev: {
        breezex-dark-cursor = final.stdenv.mkDerivation rec {
          pname = "breezex-dark-cursor";
          version = "2.0.1";
          src = final.fetchzip {
            url = "https://github.com/ful1e5/BreezeX_Cursor/releases/download/v2.0.1/BreezeX-Dark.tar.xz";
            hash = "sha256-HqjO/ogAd/dsrO5WHIilUQaq1CbiU48lEaoefcUmmBM=";
          };
          nativeBuildInputs = [ final.hyprcursor final.xcur2png ];

          unpackPhase = ''
            mkdir extracted
            hyprcursor-util --extract $src -o extracted
          '';

          buildPhase = ''
            mkdir theme
            hyprcursor-util --create "extracted/$(ls -1 extracted | head -n 1)" -o theme
            mv "theme/$(ls -1 theme | head -n 1)" breezex_dark
            echo -e "name = BreezeX Dark\ndescription = Automatically extracted with hyprcursor-util\nversion = ${version}\ncursors_directory = hyprcursors\n" > breezex_dark/manifest.hl
          '';
    
          installPhase = ''
            mkdir -p $out/share/icons
            cp -r "breezex_dark/" $out/share/icons/
          '';
        };
      };
      hyprland = final: prev: {
        hyprland = prev.hyprland.override {
          hyprland-qtutils = inputs.hyprland-guiutils.packages.x86_64-linux.default;
        };
      };
      default = lib.composeManyExtensions (lib.attrValues (builtins.removeAttrs self.overlays [ "default" ]));
    };
  };
}
