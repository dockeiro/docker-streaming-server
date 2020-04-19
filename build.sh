#!/bin/bash
# echo $DOCKERPASS | docker login -u $DOCKERUSER --password-stdin

# Variables
VERSION=$(cat VERSION) && \
IMAGE=dockeirorock/streaming-server && \
ARCH=$(dpkg --print-architecture) && \

echo +=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+= && \
echo += VERSION loaded: ${VERSION} += && \
echo +=   IMAGE loaded: ${IMAGE}   += && \
echo +=    ARCH loaded: ${ARCH}    += && \
echo +=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+= && \
sleep 10 && \

docker build --no-cache --rm --pull \
--build-arg IMAGE=${IMAGE} \
--build-arg BUILD_DATE=$(date -u +"%Y-%m-%dT%H:%M:%SZ") \
--build-arg VERSION=$(cat VERSION) \
--build-arg VCS_REF=$(git rev-parse --short HEAD) \
--build-arg VCS_URL=$(git config --get remote.origin.url) \
--tag ${IMAGE}:$(cat VERSION)-${ARCH} .