FROM alpine:latest

MAINTAINER Jioh L. Jung <ziozzang@gmail.com>

RUN apk update && apk update && apk add bind ruby && \
    rm -f /var/cache/apk/* && \
    mkdir -p /conf /opt

WORKDIR /conf/
COPY dns.rb /opt/
COPY etc/* /conf/
ENTRYPOINT ["sh", "-c", "'named -c /conf/named.conf && ruby /opt/dns.rb'"]
