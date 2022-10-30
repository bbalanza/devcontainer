#!/bin/zsh
NVM_VERSION=0.39.2
NODE_VERSION=16

installNvm() {
    curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v$NVM_VERSION/install.sh | bash
}

setupNode() {
    source $HOME/.zshrc
    nvm install $NODE_VERSION && nvm use $NODE_VERSION
}
echo "Installing nvm..."
installNvm &>/dev/null
echo "Installing node..."
setupNode &>/dev/null
