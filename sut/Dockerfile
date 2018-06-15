FROM alpine:3.7

COPY sut.sh /bin/sut.sh
RUN apk --update add bind-tools 

CMD ["/bin/sh /bin/sut.sh"]