FROM alpine:3.7


COPY sut.sh /bin/sut
RUN apk --update add bind-tools
    chmod +x /bin/sut

CMD ["/bin/sut.sh"]
