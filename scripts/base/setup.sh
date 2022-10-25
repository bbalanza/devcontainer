#!/bin/sh
echo "## Setting up development environment"
echo "## Updating and installing packages..."
apt-get -qq -y update
apt-get -qq install -y --no-install-recommends \
zsh \
curl \
ca-certificates \
git \
sudo \
neovim \
make \
cmake \
debian-keyring \
debian-archive-keyring \
apt-transport-https \
gpg
echo '## Creating user...'
groupadd --gid 1000 $USER 
useradd --uid 1000 --gid $USER --shell /bin/zsh --create-home ${USER} 
usermod -aG sudo $USER
passwd -d $USER
echo "umask 0000" >> /etc/zshrc
echo "## Install shell prompt..." 
curl -sS https://starship.rs/install.sh | sh -s -- --force
echo 'eval "$(starship init zsh)"' >> ${HOME}/.zshrc
chown vscode:vscode ${HOME}/.zshrc
echo "## Install Caddy"
curl -1sLf 'https://dl.cloudsmith.io/public/caddy/testing/gpg.key' | gpg --dearmor -o /usr/share/keyrings/caddy-testing-archive-keyring.gpg
curl -1sLf 'https://dl.cloudsmith.io/public/caddy/testing/debian.deb.txt' | tee /etc/apt/sources.list.d/caddy-testing.list
apt update
apt install caddy