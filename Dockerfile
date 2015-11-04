FROM debian:jessie
MAINTAINER Guilherme Gondim

ENV DEBIAN_FRONTEND noninteractive
ENV ZNC_VERSION 1.6.1

RUN apt-get update \
    && apt-get install -y build-essential pkg-config swig3.0 wget \
                          libicu-dev libperl-dev libssl-dev \
    && cd /usr/local/src \
    && wget -O znc.tar.gz "http://znc.in/releases/archive/znc-${ZNC_VERSION}.tar.gz" \
    && tar -xzf znc.tar.gz \
    && cd "znc-${ZNC_VERSION}" \
    && ./configure \
    && make \
    && make install \
    && apt-get remove -y wget \
    && apt-get autoremove -y \
    && apt-get clean \
    && rm -rf /usr/local/src/* /var/lib/apt/lists/* /tmp/* /var/tmp/*

RUN useradd --user-group --create-home --home-dir /data znc

EXPOSE 6667
EXPOSE 6697

VOLUME /data

USER znc
ENTRYPOINT ["/usr/local/bin/znc", "--datadir", "/data", "--foreground"]
