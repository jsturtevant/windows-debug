#!/bin/bash

version="${VERSION:=v1.0.0}"
image="${IMAGE:=ghcr.io/jsturtevant/windows-debug:$version}"

on_exit() {
    docker buildx rm img-builder
}

trap on_exit EXIT

docker buildx create --name img-builder --use --platform windows/and64
docker buildx build --platform windows/amd64 --output=type=registry -f Dockerfile -t "$image" .
