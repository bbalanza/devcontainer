#!/usr/bin/env zsh
set -ex

testInstall() {
    command -v rustup
    command -v rustc
    command -v cargo
    command -v wasm-pack
    command -v cc
    command -v gcc
}
print "## Testing image..."
testInstall 
print "## All done!"