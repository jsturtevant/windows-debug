#!/bin/bash
set -x
output=${OUTPUT:=local,dest=/tmp/}
INSTALLER_VERSION="${INSTALLER_VERSION:=latest}"
version="${VERSION:=latest}"
image="${IMAGE:=ghcr.io/jsturtevant/windows-debug:$version}"

on_exit() {
    docker buildx rm img-builder
}

trap on_exit EXIT

docker buildx create --name img-builder --use --platform windows/and64
docker buildx build \
    --platform windows/amd64 \
    --output=type=$output \
    --build-arg INSTALLER_VERSION="$INSTALLER_VERSION" \
    -f Dockerfile \
    -t "$image" .
