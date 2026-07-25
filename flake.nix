{
  description = "Marp environment";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixpkgs-unstable";
    flake-utils.url = "github:numtide/flake-utils";
    dotfiles-private.url = "git+ssh://git@github.com/ryuryu333/dotfiles-private.git";
  };

  outputs =
    {
      nixpkgs,
      flake-utils,
      dotfiles-private,
    }:
    let
      supportSystems = with flake-utils.lib.system; [
        x86_64-linux
        aarch64-darwin
      ];
    in
    flake-utils.lib.eachSystem supportSystems (
      system:
      let
        pkgs = import nixpkgs {
          inherit system;
          config.allowUnfreePredicate =
            pkg:
            builtins.elem (pkgs.lib.getName pkg) [
              "terraform"
            ];
        };
        
        place_slide_assets = pkgs.writeShellApplication {
          name = "place-slide-assets";
          text = ''
            mkdir -p slides/utl/images
            cp -R ${dotfiles-private.slideAssets}/. slides/utl/images/
          '';
        };
      in
      {
        apps.place-slide-assets = {
          type = "app";
          program = "${place_slide_assets}/bin/place-slide-assets";
        };

        devShells.default = pkgs.mkShell {
          packages = with pkgs; [
            marp
            go-task
            fontconfig
            google-chrome

          ];
          FONTCONFIG_FILE = pkgs.makeFontsConf {
            fontDirectories = with pkgs; [
              hachimarupop
              noto-fonts-cjk-sans
            ];
        };
      }
    );
}
