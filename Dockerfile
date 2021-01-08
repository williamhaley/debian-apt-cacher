FROM debian

ARG DEBIAN_FRONTEND=noninteractive

RUN apt update \
    && apt-get install -y \
        apt-cacher-ng \
    && apt-get -q -y autoremove \
    && apt-get -q -y clean \
    && rm -rf /var/lib/apt/lists/*

ADD lib/cacher /bin/cacher
RUN chmod +x /bin/cacher

