
## Buildstage ##
FROM ghcr.io/linuxserver/baseimage-ubuntu:bionic as buildstage

RUN \
 echo "**** install openvpn ****" && \
 apt update && \
 apt install -y openvpn

# copy local files
COPY root/ /root-layer/

## Single layer deployed image ##
FROM scratch

# Add files from buildstage
COPY --from=buildstage /root-layer/ /