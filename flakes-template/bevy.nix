{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs";
    utils.url = "github:numtide/flake-utils";
    rust-overlay.url = "github:oxalica/rust-overlay";
  };

  outputs = { self, nixpkgs, utils, rust-overlay, }:
    utils.lib.eachDefaultSystem (system:
      let
        overlays = [ (import rust-overlay) ];
        pkgs = import nixpkgs { inherit system overlays; };
        rust = pkgs.rust-bin.selectLatestNightlyWith (toolchain:
          toolchain.default.override {
            extensions = [
              "rust-src"
              "rust-analyzer"
              "rustfmt"
              "clippy"
              "rustc-codegen-cranelift-preview"
            ];
            targets = [ "aarch64-unknown-linux-gnu" "wasm32-unknown-unknown" ];
          });
      in {
        devShell = with pkgs;
          mkShell.override {
            stdenv = pkgs.stdenvAdapters.useMoldLinker pkgs.clangStdenv;
          } {
            buildInputs = [
              rust
              openssl.dev
              pkg-config
              vulkan-tools
              vulkan-headers
              vulkan-loader
              vulkan-validation-layers
              alsa-lib
              libudev-zero
              clang
              fontconfig
              freetype
              libGL
              wayland
              libxkbcommon
            ];
            RUST_SRC_PATH = rustPlatform.rustLibSrc;
            LD_LIBRARY_PATH = pkgs.lib.makeLibraryPath [
              pkgs.libxkbcommon
              pkgs.vulkan-loader
              pkgs.alsa-lib
              pkgs.udev
              pkgs.wayland
            ];
          };
      });
}
