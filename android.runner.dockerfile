FROM brauliobalanza/devcontainer:base
RUN mkdir scripts
COPY --chown=vscode:vscode ./scripts/android.runner/install-dependencies.sh ./scripts/install-dependencies.sh
RUN ./scripts/install-dependencies.sh
COPY --chown=vscode:vscode ./scripts/android.runner/setup.sh ./scripts/setup.sh
RUN ./scripts/setup.sh
COPY --chown=vscode:vscode ./scripts/android.runner/test.sh ./scripts/test.sh
RUN ./scripts/test.sh
RUN rm -rf ./scripts 
CMD ["/bin/zsh"]