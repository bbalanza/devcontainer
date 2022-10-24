FROM ubuntu:jammy
ENV USER=vscode
ENV HOME /home/${USER}
WORKDIR /
COPY scripts/base/setup.sh .
RUN ./setup.sh && rm -rf ./setup.sh
COPY config/starship/.config ${HOME}/.config/
USER $USER
WORKDIR ${HOME}
SHELL ["/bin/zsh", "-c"]
CMD [ "/bin/zsh" ]


