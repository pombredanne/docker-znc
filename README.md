First setup:

    mkdir -p /srv/data/znc
    docker run -ti -v /srv/data/znc:/data semente/znc --makepem
    docker run -ti -v /srv/data/znc:/data semente/znc --makeconf

To run (detached):

    docker run -d -p 6667:6667 -v /srv/data/znc:/data semente/znc
