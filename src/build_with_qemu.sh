#!/usr/bin/env bash

set -ux

export DOCKER_CLI_EXPERIMENTAL=enabled

docker run --rm --privileged multiarch/qemu-user-static --reset -p yes
docker buildx create --use --driver docker-container

PLATFORM=("linux/arm/v7")

IMAGE=$1
TAG=$2

docker buildx build $IMAGE --pull --progress plain \
    ${PLATFORM[@]/#/--platform } \
    ${PLATFORM[@]/#/--cache-from type=local,src=.cache/} \
    --tag $TAG --push

docker buildx rm
