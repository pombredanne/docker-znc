FROM debian:jessie
MAINTAINER Guilherme Gondim <guilheme@semente.io>

VOLUME ["/data"]
EXPOSE 6667

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update -q
RUN apt-get install -yq znc

ENTRYPOINT ["/usr/bin/znc", "--datadir", "/data", "--allow-root", "--foreground"]
