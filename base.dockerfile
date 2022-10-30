FROM ubuntu:jammy
ENV USER=vscode
ENV HOME /home/${USER}
WORKDIR /
COPY scripts/base/setup.sh .
RUN ./setup.sh 
COPY config/starship/.config ${HOME}/.config/
USER $USER
COPY --chown=$USER:$USER ./scripts/base/node-install.sh ./scripts/node-install.sh
RUN ./scripts/node-install.sh 
COPY --chown=$USER:$USER ./scripts/base/test.sh ./scripts/test.sh
RUN ./scripts/test.sh 
RUN sudo rm -rf ./scripts/*
WORKDIR ${HOME}
SHELL ["/bin/zsh", "-c"]
CMD [ "/bin/zsh" ]


