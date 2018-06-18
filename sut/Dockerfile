FROM alpine:latest

COPY sut.sh /bin/sut.sh
RUN apk --update add bind-tools pkgconf ncurses-terminfo ncurses-terminfo-base ncurses-libs readline bash ca-certificates libcurl libssh2 curl oniguruma jq

ENTRYPOINT ["/bin/bash"]
CMD ["/bin/sut.sh"]
