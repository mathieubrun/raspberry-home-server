#!/usr/bin/env bash

set -ux

SYNCTHING_VERSION=v1.6.1

git clone --branch $SYNCTHING_VERSION https://github.com/syncthing/syncthing upstream/syncthing
echo $SYNCTHING_VERSION > upstream/syncthing/RELEASE

./build_with_qemu.sh upstream/syncthing mathieubrun/syncthing:$SYNCTHING_VERSION
