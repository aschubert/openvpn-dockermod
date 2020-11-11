
## Buildstage ##
FROM ghcr.io/linuxserver/baseimage-ubuntu:bionic as buildstage

COPY install.sh /tmp/install.sh
RUN mkdir /root-layer
WORKDIR /root-layer
RUN bash /tmp/install.sh

## Single layer deployed image ##
FROM scratch

# Add files from buildstage
COPY --from=buildstage /root-layer/ /

COPY root/ /