FROM emscripten/emsdk as emsdk-stage
FROM brauliobalanza/devcontainer:base
ENV DOCKER_EMSDK /emsdk
ENV EMSDK ${HOME}${DOCKER_EMSDK}
COPY --from=emsdk-stage --chown=$USER:$USER ${DOCKER_EMSDK} ${HOME}${DOCKER_EMSDK}
COPY --chown=$USER:$USER ./scripts/emscripten/install-dependencies.sh ./scripts/install-dependencies.sh
RUN ./scripts/install-dependencies.sh && rm ./scripts/install-dependencies.sh
COPY --chown=$USER:$USER ./scripts/emscripten/node-install.sh ./scripts/node-install.sh
RUN ./scripts/node-install.sh && rm ./scripts/node-install.sh
COPY --chown=$USER:$USER ./scripts/emscripten/emsdk-setup.sh ./scripts/emsdk-setup.sh
RUN ./scripts/emsdk-setup.sh && rm ./scripts/emsdk-setup.sh
RUN rm -rf ./scripts
CMD [ "/bin/zsh" ]