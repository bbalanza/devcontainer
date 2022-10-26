FROM brauliobalanza/devcontainer:base
RUN mkdir scripts
COPY --chown=vscode:vscode ./scripts/android.runner/install-dependencies.sh ./scripts/install-dependencies.sh
RUN ./scripts/install-dependencies.sh
COPY --chown=vscode:vscode ./scripts/android.runner/setup.sh ./scripts/setup.sh
RUN ./scripts/setup.sh
COPY --chown=vscode:vscode ./scripts/android.runner/test_dockerimage.sh ./scripts/test_dockerimage.sh
USER $USER
RUN ./scripts/test_dockerimage.sh
RUN rm -rf ./scripts 
CMD ["/bin/zsh"]