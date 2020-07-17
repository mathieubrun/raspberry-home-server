#!/usr/bin/env bash

set -ux

SYNCTHING_VERSION=v1.7.1

./build_with_qemu.sh https://github.com/syncthing/syncthing.git#$SYNCTHING_VERSION mathieubrun/syncthing:$SYNCTHING_VERSION
