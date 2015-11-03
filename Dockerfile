FROM debian:jessie
MAINTAINER Guilherme Gondim

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update \
    && apt-get install -y znc \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

RUN useradd --user-group --create-home --home-dir /data znc

EXPOSE 6667
EXPOSE 6697

VOLUME /data

USER znc
ENTRYPOINT ["/usr/bin/znc", "--datadir", "/data", "--foreground"]
