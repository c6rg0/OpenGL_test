{
  description = "An opengl test";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
  };

  outputs = { self, nixpkgs }: {
    packages = nixpkgs.lib.genAttrs [ "aarch64-darwin" "x86_64-linux" ] (system:
    let
      pkgs = import nixpkgs { inherit system; };
    in
    rec {
      simple-parse-example = pkgs.stdenv.mkDerivation {
        pname = "opengl_test";
        version = "0.1";

        src = ./.;

        nativeBuildInputs = with pkgs; [ 
          gcc 
          glfw 
          libGL 
          pkg-config 
        ];

        buildInputs = with pkgs; [ 
          glfw 
          libGL 
          pkg-config 
        ];

        buildPhase = ''
          gcc src/main.c src/glad.c -Iinclude -o opengl_test $(pkg-config --cflags --libs glfw3)
        '';

        installPhase = ''
          mkdir -p $out/bin
          cp opengl_test $out/bin/
        '';

        meta = with pkgs.lib; {
          description = "An opengl test";
          license = licenses.mit;
          maintainers = [ maintainers.c6rg0 ];
          platforms = platforms.unix;
        };
      };
    });

    defaultPackage = {
      aarch64-darwin = self.packages.aarch64-darwin.simple-parse-example;
      x86_64-linux = self.packages.x86_64-linux.simple-parse-example;
    };

    defaultApp = {
      forAllSystems = nixpkgs.lib.mapAttrs' (system: pkg: {
        inherit system;
        defaultApp = {
          type = "app";
          program = "${pkg.simple-parse-example}/bin/opengl_test";
        };
      }) self.packages;
    };
  };
}
