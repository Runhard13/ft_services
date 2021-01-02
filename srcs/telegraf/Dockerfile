FROM alpine:latest

RUN echo "http://dl-cdn.alpinelinux.org/alpine/edge/community/" >> /etc/apk/repositories
RUN apk update && apk upgrade
RUN apk --no-cache add telegraf


COPY telegraf.conf /etc/telegraf/

CMD telegraf