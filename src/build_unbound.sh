#!/usr/bin/env bash

set -ux

git clone https://gitlab.com/klutchell/unbound.git upstream/unbound

./build_with_qemu.sh upstream/unbound mathieubrun/unbound:master
