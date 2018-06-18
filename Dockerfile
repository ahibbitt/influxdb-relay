FROM alpine:latest

RUN apk update && apk upgrade && \
    apk add pkgconf ncurses-terminfo ncurses-terminfo-base ncurses-libs readline bash python py-pip && \
    apk --virtual build-deps add go>1.6 curl gcc git musl-dev make && \
    export GOPATH=/go && \
    go get -v github.com/influxdata/influxdb-relay && \
    cd $GOPATH/src/github.com/influxdata/influxdb-relay && \
    python ./build.py && \
    chmod +x ./build/influx* && \
    ls -l ./build/* && \
    mv ./build/influx* /bin/ && \
    /usr/bin/pip install argparse Jinja2 MarkupSafe envtpl  && \
    apk del build-deps && cd / && rm -rf $GOPATH/ /var/cache/apk/*

EXPOSE 9096

COPY relay.toml /etc/relay.toml.tpl
COPY run.sh /bin/

ENTRYPOINT ["/bin/sh", "-c"]
CMD ["/bin/bash", "/bin/run.sh"]

LABEL maintainer="7901922+ahibbitt@users.noreply.github.com"
