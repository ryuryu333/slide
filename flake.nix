{
  description = "Marp environment";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixpkgs-unstable";
    flake-utils.url = "github:numtide/flake-utils";
    dotfiles-private.url = "git+ssh://git@github.com/ryuryu333/dotfiles-private.git";
    marp-theme-dracula = {
      url = "github:dracula/marp";
      flake = false;
    };
  };

  outputs =
    {
      self,
      nixpkgs,
      flake-utils,
      dotfiles-private,
      marp-theme-dracula,
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
              "google-chrome"
            ];
        };

        place_slide_assets = pkgs.writeShellApplication {
          name = "place-slide-assets";
          text = ''
            mkdir -p slides/utl/images
            cp -Rf ${dotfiles-private.slideAssets}/. slides/utl/images/

            mkdir -p themes/third-party
            ln -sfn ${marp-theme-dracula}/dracula themes/third-party/dracula
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
            marp-cli
            go-task
            fontconfig
            google-chrome
          ];

          CHROME_PATH = pkgs.lib.getExe pkgs.google-chrome;

          FONTCONFIG_FILE = pkgs.makeFontsConf {
            fontDirectories = with pkgs; [
              hachimarupop
              noto-fonts-cjk-sans
            ];
          };
        };
      }
    );
}
