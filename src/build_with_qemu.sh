#!/usr/bin/env bash

set -ux

export DOCKER_CLI_EXPERIMENTAL=enabled

docker run --rm --privileged multiarch/qemu-user-static --reset -p yes
docker buildx create --use --driver docker-container

PLATFORM=("linux/arm/v7")

IMAGE=$0
TAG=$1

cd $IMAGE

docker buildx build . --pull --progress plain \
    ${PLATFORM[@]/#/--platform } \
    ${PLATFORM[@]/#/--cache-from type=local,src=.cache/} \
    --tag $TAG --push

cd -


docker buildx rm
