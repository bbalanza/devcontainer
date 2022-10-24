FROM debian:bookworm
ARG USER=vscode

RUN echo "## Setting up development environment" \
    && echo "## Updating and installing packages..." \
    && apt-get -qq -y update \
    && apt-get -qq install -y --no-install-recommends \
    zsh \
    curl \
    ca-certificates \
    git \
    sudo \
    neovim \
    && echo '## Creating user...' \
    && groupadd --gid 1000 $USER \
    && useradd --uid 1000 --gid $USER --shell /bin/zsh --create-home vscode \
    && usermod -aG sudo $USER \
    && passwd -d $USER \
    && echo "umask 0000" >> /etc/zshrc \
    && echo "## Install shell prompt..." \
    && curl -sS https://starship.rs/install.sh | sh -s -- --force \ 
    && echo 'eval "$(starship init zsh)"' >> /home/$USER/.zshrc
COPY config/starship/.config /home/$USER/.config/
USER $USER
CMD [ "/bin/zsh" ]


