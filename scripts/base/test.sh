#!/usr/bin/env zsh

runTests() {
    source $HOME/.zsh
    command -v zsh
    command -v curl
    command -v ca-certificates
    command -v git
    command -v sudo
    command -v neovim
    command -v make
    command -v cmake
    command -v debian-keyring
    command -v debian-archive-keyring
    command -v gpg
    command -v nvm
    command -v node
    command -v starship
}

print "## Testing..."
runTests
