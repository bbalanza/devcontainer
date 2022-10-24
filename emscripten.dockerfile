FROM emscripten/emsdk as emsdk-stage
FROM brauliobalanza/devcontainer:base
ENV EMSDK /emsdk
COPY --from=emsdk-stage --chown=$USER:$USER ${EMSDK} ${HOME}${EMSDK}
ENV EMSDK ${HOME}${EMSDK}
COPY scripts/emscripten .
RUN ./node-install.sh && rm -f ./node-install.sh
CMD [ "/bin/zsh" ]