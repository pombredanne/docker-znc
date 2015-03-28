# SEMENTE/ZNC CONTAINER

## Setup & Run

To setup (using a Data Volume Container):

    docker run --name znc-data -v /data -ti semente/znc --version
    docker run --volumes-from znc-data -ti semente/znc --makepem
    docker run --volumes-from znc-data -ti semente/znc --makeconf

To run:

    docker run -d -p 6667:6667 --volumes-from znc-data semente/znc

**Note**: change ports to your choices
