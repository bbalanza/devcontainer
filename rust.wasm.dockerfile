FROM brauliobalanza/devcontainer:base 
WORKDIR $HOME
COPY --chown=$USER=$USER ./scripts/rust.wasm/install-dependencies.sh ./scripts/install-dependencies.sh
RUN ./scripts/install-dependencies.sh
COPY --chown=$USER=$USER ./scripts/rust.wasm/install-rust.sh ./scripts/install-rust.sh
RUN ./scripts/install-rust.sh
COPY --chown=$USER=$USER ./scripts/rust.wasm/test.sh ./scripts/test.sh
RUN ./scripts/test.sh
RUN sudo rm -rf ./scripts
CMD [ "/usr/bin/env zsh" ]