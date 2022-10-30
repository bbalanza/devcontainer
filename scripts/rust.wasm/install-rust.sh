#!/usr/bin/env zsh
ARCH=x86_64
installRust() {
    curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs \
    | sh -s -- \
    -y \
    --default-toolchain  nightly-$ARCH-unknown-linux-gnu \
    --profile minimal \
    --component rust-src \
    --target wasm32-unknown-unknown
    cat <<'EOF' >>$HOME/.zshrc
source "$HOME/.cargo/env"
EOF
    source $HOME/.zshrc

}

installRustNightly-2022-04-07() {
    rustup toolchain install nightly-2022-04-07-$ARCH-unknown-linux-gnu
    rustup component add rust-src --toolchain nightly-2022-04-07-$ARCH-unknown-linux-gnu
    rustup target add wasm32-unknown-unknown --toolchain nightly-2022-04-07-$ARCH-unknown-linux-gnu
}

installWasmPack() {
    curl https://rustwasm.github.io/wasm-pack/installer/init.sh -sSf | sh
    sudo chown $USER:$USER $HOME/.rustup -R
}

print "## Installing Rust nightly..." 
installRust &>/dev/null
print "## Installing Rust nightly-2022-04-07..." 
installRustNightly-2022-04-07 &>/dev/null
print "## Installing wasm-pack..."
installWasmPack &>/dev/null