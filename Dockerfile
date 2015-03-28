FROM debian:jessie
MAINTAINER Guilherme Gondim

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update
RUN apt-get install -y znc

RUN useradd --user-group --create-home --home-dir /data znc

VOLUME /data

USER znc
ENTRYPOINT ["/usr/bin/znc", "--datadir", "/data", "--foreground"]
