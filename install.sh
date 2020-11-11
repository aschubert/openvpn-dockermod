#!/bin/bash

set -e

echo "**** install openvpn and required libs ****"
chmod 777 /root-layer
apt-get update
apt-get install -y binutils xz-utils
for package in openvpn liblzo2-2 multiarch-support libpkcs11-helper1 iproute2 libatm1 libelf1 libmnl0 libxtables12
do
    apt-get download $package
    ar p /root-layer/${package}*.deb data.tar.xz | tar xJv --strip-components=1 -f -
    rm ${package}*.deb
done
rm /tmp/install.sh