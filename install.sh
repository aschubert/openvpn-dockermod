#!/bin/bash

set -e

echo "**** install openvpn ****"
chmod 777 /root-layer
apt-get update
apt-get install -y binutils xz-utils
apt-get download openvpn
ar p /root-layer/openvpn*.deb data.tar.xz | tar xJv --strip-components=1 -f -
rm openvpn*.deb
rm /tmp/install.sh