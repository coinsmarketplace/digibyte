FROM ubuntu:16.04

RUN apt-get update \
    && apt-get -y install build-essential libtool autotools-dev automake pkg-config libssl-dev libevent-dev \
    bsdmainutils libboost-system-dev libboost-filesystem-dev libboost-chrono-dev libboost-program-options-dev \
    libboost-test-dev libboost-thread-dev git ca-certificates curl libminiupnpc-dev autoconf libdb++-dev

WORKDIR /home/digibyte

RUN apt-get -y install software-properties-common \
    && git clone https://github.com/digibyte/digibyte . \
    && git checkout v7.17.2

RUN ./autogen.sh \
    && ./configure --with-incompatible-bdb \
    && make \
    && ln ./src/digibyted /usr/local/bin/digibyted

CMD ["digibyted"]
