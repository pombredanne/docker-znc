FROM debian:jessie
MAINTAINER Guilherme Gondim

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update
RUN apt-get install -y znc

RUN useradd --no-create-home --home-dir /nonexistent --uid 1000 --user-group znc

RUN mkdir /data
RUN chown 1000.1000 /data
VOLUME /data

USER znc
ENTRYPOINT ["/usr/bin/znc", "--datadir", "/data", "--foreground"]
