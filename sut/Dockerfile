FROM alpine:latest

COPY sut.sh /bin/sut.sh
RUN apk --update add bind-tools pkgconf ncurses-terminfo ncurses-terminfo-base ncurses-libs readline bash

CMD ["/bin/bash", "/bin/sut.sh"]
