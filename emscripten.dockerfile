FROM emscripten/emsdk as emsdk-stage
FROM brauliobalanza/devcontainer:base
ENV EMSDK /emsdk
COPY --from=emsdk-stage --chown=$USER:$USER ${EMSDK} ${HOME}${EMSDK}
ENV EMSDK ${HOME}${EMSDK}
COPY --chown=$USER:$USER scripts/emscripten ./scripts
RUN ./scripts/install-dependencies.sh
RUN ./scripts/node-install.sh 
RUN ./scripts/emsdk-setup.sh
RUN rm -rf ./scripts
CMD [ "/bin/zsh" ]