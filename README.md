# semente/znc

## Setup & Run

To setup (using a Data Volume Container):

    docker run --name data-znc -v /data -ti semente/znc --help
    docker run --volumes-from data-znc -ti semente/znc --makepem
    docker run --volumes-from data-znc -ti semente/znc --makeconf

To run:

    docker run -d -p 6667:6667 --volumes-from data-znc semente/znc

**Note**: change ports to your choices


## Backup & Restore Data Volumes

To backup:

    docker run --volumes-from data-znc -v $(pwd):/backup debian:jessie \
        tar cvf /backup/data-znc.tar /data

To restore:

    docker run --volumes-from data-znc -v $(pwd):/backup debian:jessie \
        tar xvf /backup/data-znc.tar
