FROM emscripten/emsdk as emsdk-stage
FROM brauliobalanza/devcontainer:base
ENV DOCKER_EMSDK /emsdk
ENV EMSDK ${HOME}${DOCKER_EMSDK}
COPY --from=emsdk-stage --chown=$USER:$USER ${DOCKER_EMSDK} ${HOME}${DOCKER_EMSDK}
COPY --chown=$USER:$USER ./scripts/install-dependencies.sh ./scripts/install-dependencies.sh
RUN ./scripts/install-dependencies.sh
COPY --chown=$USER:$USER ./scripts/node-install.sh ./scripts/node-install.sh
RUN ./scripts/node-install.sh 
RUN ./scripts/emsdk-setup.sh
RUN ./testemcc.sh
RUN rm -rf ./scripts
CMD [ "/bin/zsh" ]