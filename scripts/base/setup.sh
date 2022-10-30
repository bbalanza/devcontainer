#!/bin/bash
installDependencies() {
    apt-get -qq -y update
    apt-get -qq install -y --no-install-recommends \
        zsh \
        curl \
        ca-certificates \
        git \
        sudo \
        neovim \
        make \
        cmake
    

}

createUser() {
    groupadd --gid 1000 $USER
    useradd --uid 1000 --gid $USER --shell /bin/zsh --create-home ${USER}
    usermod -aG sudo $USER
    passwd -d $USER
    echo "umask 0000" >>/etc/zshrc
}

installShellPropmt() {
    curl -sS https://starship.rs/install.sh | sh -s -- --force
    echo 'eval "$(starship init zsh)"' >>${HOME}/.zshrc
    chown $USER:$USER ${HOME}/.zshrc
}

installCaddy() {
    apt-get -qq install -y --no-install-recommends \
        debian-keyring \
        debian-archive-keyring \
        apt-transport-https \
        gpg
    curl -1sLf 'https://dl.cloudsmith.io/public/caddy/stable/gpg.key' | gpg --dearmor -o /usr/share/keyrings/caddy-stable-archive-keyring.gpg
    curl -1sLf 'https://dl.cloudsmith.io/public/caddy/stable/debian.deb.txt' | tee /etc/apt/sources.list.d/caddy-stable.list
    apt -qq update
    apt -qq install caddy
}

cleanInstall() {
    apt-get clean
    rm -rf /var/lib/apt/lists/*
}

echo "## Setting up development environment"
echo "## Updating and installing packages..."
installDependencies &>/dev/null
echo '## Creating user...'
createUser &>/dev/null
echo "## Install shell prompt..."
installShellPropmt &>/dev/null
echo "## Install Caddy..."
installCaddy &>/dev/null
echo "Cleaning install..."
cleanInstall &>/dev/null
